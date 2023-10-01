import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart' as p;

import '../../../../core/constants/constants.dart';
import '../../domain/entities/salon_group.dart';
import '../../domain/usecases/get_salons_usecase.dart';
import '../../domain/usecases/get_top_rated_salons_usecase.dart';
import '../models/salon.dart';
import '../models/salon_amenity.dart';
import '../models/services_category.dart';

abstract class SalonDataSource {
  Future<List<SalonGroup>> getSalons([GetSalonsParams? params]);
  Future<List<SalonGroup>> getTopRatedSalons([GetTopRatedSalonsParams? params]);
}

class SalonDataSourceImpl implements SalonDataSource {
  final FirebaseFirestore db;
  final FirebaseStorage storage;
  SalonDataSourceImpl(this.db, this.storage);

  Future<Query<Salon>> _filterSalons(
    Query<Salon> salonsColRef,
    GetSalonsParams? params,
  ) async {
    final limit = params?.limit;
    final orderBy = params?.orderBy;

    if (orderBy != null) {
      salonsColRef = salonsColRef.orderBy(
        orderBy.field,
        descending: orderBy.descending,
      );
    }
    if (limit != null) {
      salonsColRef = salonsColRef.limit(limit);
    }

    return salonsColRef;
  }

  Future<List<SalonAmenity>> _getSalonAmenities(
      List<dynamic>? amenityDocs) async {
    if (amenityDocs == null) return [];

    final amenities = amenityDocs.map((doc) {
      return (doc as DocumentReference).withConverter(
        fromFirestore: (snapshot, options) {
          return SalonAmenity.fromJson(snapshot.data()!);
        },
        toFirestore: (value, options) => value.toJson(),
      );
    }).toList();

    try {
      final futures = List.generate(
        amenities.length,
        (index) async {
          final doc = await amenities[index].get();
          return doc.data()!;
        },
      );
      return Future.wait(futures);
    } catch (e, s) {
      Logger().e("Error", error: e, stackTrace: s);
      rethrow;
    }
  }

  Future<List<ServicesCategory>> _getSalonServiceCategories(
      String salonId) async {
    final categoriesRef = db
        .collection(FC.cSalons)
        .doc(salonId)
        .collection(FC.cServiceCategories)
        .withServicesCategoryConverter();
    try {
      final snapshot = await categoriesRef.get();

      return List.generate(
        snapshot.size,
        (index) => snapshot.docs[index].data(),
      );
    } catch (e, s) {
      Logger().e("Error", error: e, stackTrace: s);
      rethrow;
    }
  }

  /// Processes a list of salons and their amenities concurrently.
  ///
  /// [salons] The list of salons to process.
  ///
  /// Returns a list of `SalonGroup` objects, where each `SalonGroup` object
  /// contains a salon, its amenities, and its service categories.
  Future<List<SalonGroup>> _processSalonsAndAmenitiesConcurrently(
      Iterable<DocumentSnapshot<Salon>> salons) async {
    // Create a list of `SalonGroup` objects.
    final data = <SalonGroup>[];

    // Iterate over the salons and process each one.
    for (final salonDoc in salons) {
      // Get the salon data.
      Salon? salon = salonDoc.data();
      if (salon == null) continue;

      // Get the salon's profile image URL.
      final salonFolderPath = p.join(FC.fImages, FC.fSalons, salon.id);
      final salonFolderRef = storage.ref(salonFolderPath);
      final profileImageName = salon.profileImageUrl;
      if (profileImageName.isNotEmpty) {
        final profileImage =
            await salonFolderRef.child(profileImageName).getDownloadURL();
        salon = salon.copyWith(profileImageUrl: profileImage);
      }

      // Get the salon's shots.
      final shots = <String>[];
      final shotsResult = await salonFolderRef.child(FC.fShots).list();
      for (var item in shotsResult.items) {
        final imageUrl = await item.getDownloadURL();
        shots.add(imageUrl);
      }
      salon = salon.copyWith(shots: shots);

      // Get the salon's amenities.
      final amenities = await _getSalonAmenities(salonDoc.get(FC.cAmenities));

      // Get the salon's service categories.
      final serviceCategories = await _getSalonServiceCategories(salon.id);

      // Add a `SalonGroup` object to the list.
      data.add(
        SalonGroup(
          salon: salon,
          amenities: amenities,
          categories: serviceCategories,
        ),
      );
    }

    // Return the list of `SalonGroup` objects.
    return data;
  }

  /// Gets a list of salons.
  ///
  /// [params] Optional parameters for filtering the results.
  @override
  Future<List<SalonGroup>> getSalons([GetSalonsParams? params]) async {
    try {
      // Get the collection reference for salons.
      Query<Salon> salonsColRef =
          db.collection(FC.cSalons).withSalonConverter();

      // Filter the salons if necessary.
      salonsColRef = await _filterSalons(salonsColRef, params);

      // Get the snapshot of the filtered salons.
      final snapshot = await salonsColRef.get();

      // Process the salons and amenities concurrently.
      final data = await _processSalonsAndAmenitiesConcurrently(snapshot.docs);

      return data;
    } catch (e, s) {
      Logger().e("Error", error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<List<SalonGroup>> getTopRatedSalons(
      [GetTopRatedSalonsParams? params]) {
    try {
      final data = getSalons(
        GetSalonsParams(
          limit: params?.limit,
          orderBy: OrderBy("rating_average", descending: true),
        ),
      );

      return data;
    } catch (e, s) {
      Logger().e("Error", error: e, stackTrace: s);
      rethrow;
    }
  }
}
