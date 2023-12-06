import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logger/logger.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/models/order_by.dart';
import '../../domain/usecases/get_salons_usecase.dart';
import '../../domain/usecases/get_top_rated_salons_usecase.dart';
import '../../domain/usecases/search_salons_usecase.dart';
import '../models/salon.dart';
import '../models/salon_amenity.dart';
import '../models/salon_service.dart';
import '../models/services_category.dart';

abstract class SalonDataSource {
  Future<List<Salon>> getSalons([GetSalonsParams? params]);
  Future<List<Salon>> getTopRatedSalons([GetTopRatedSalonsParams? params]);
  Future<List<ServicesCategory>> getTPLServiceCategories();
  Future<List<SalonService>> getTPLServices();
  Future<List<Salon>> search([SalonSearchParams? params]);
}

class SalonDataSourceImpl implements SalonDataSource {
  final FirebaseFirestore db;
  final FirebaseStorage storage;
  const SalonDataSourceImpl(this.db, this.storage);

  Future<Query<Salon>> _filterSalons(
    Query<Salon> salonsColRef,
    GetSalonsParams? params,
  ) async {
    final limit = params?.limit;
    final orderBy = params?.orderBy;
    final filters = params?.filters;

    if (orderBy != null) {
      salonsColRef = salonsColRef.orderBy(
        orderBy.field,
        descending: orderBy.descending,
      );
    }
    if (limit != null) {
      salonsColRef = salonsColRef.limit(limit);
    }

    if (filters != null) {
      for (var filter in filters) {
        salonsColRef = salonsColRef.where(
          filter.field,
          isEqualTo: filter.isEqualTo,
          isNotEqualTo: filter.isNotEqualTo,
          isLessThan: filter.isLessThan,
          isLessThanOrEqualTo: filter.isLessThanOrEqualTo,
          isGreaterThan: filter.isGreaterThan,
          isGreaterThanOrEqualTo: filter.isGreaterThanOrEqualTo,
          arrayContains: filter.arrayContains,
          arrayContainsAny: filter.arrayContainsAny,
          whereIn: filter.whereIn,
          whereNotIn: filter.whereNotIn,
          isNull: filter.isNull,
        );
      }
    }

    return salonsColRef;
  }

  Future<String> _getProfileImage(String imageName, String salonId) async {
    final salonFolderPath = FC.getSalonFolderPath(salonId);
    final salonFolderRef = storage.ref(salonFolderPath);

    if (imageName.isNotEmpty) {
      final imageRef = salonFolderRef.child(imageName);
      return imageRef.getDownloadURL();
    }

    return "";
  }

  Future<List<String>> _getShots(String salonId) async {
    final shots = <String>[];
    final salonFolderPath = FC.getSalonFolderPath(salonId);
    final salonFolderRef = storage.ref(salonFolderPath);

    final list = await salonFolderRef.child(FC.fSalonShots).list();
    for (var item in list.items) {
      final imageUrl = await item.getDownloadURL();
      shots.add(imageUrl);
    }

    return shots;
  }

  Future<List<SalonAmenity>> _getSalonAmenities(
      List<dynamic>? docReferences) async {
    if (docReferences == null) return [];

    final amenities = docReferences.map((doc) {
      return (doc as DocumentReference).withSalonAmenityConverter();
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

  Future<List<SalonService>> _getServices(List<dynamic>? docReferences) async {
    if (docReferences == null) return [];

    final services = docReferences.map((doc) {
      return (doc as DocumentReference).withSalonServiceConverter();
    }).toList();

    try {
      final futures = List.generate(
        services.length,
        (index) async {
          final doc = await services[index].get();
          return doc.data()!;
        },
      );
      return Future.wait(futures);
    } catch (e, s) {
      Logger().e("Error", error: e, stackTrace: s);
      rethrow;
    }
  }

  Future<List<Salon>> _processSalons(QuerySnapshot<Salon> snapshot) async {
    // Create a list of `SalonGroup` objects.
    final data = <Salon>[];

    // Iterate over the salons and process each one.
    for (final salonDoc in snapshot.docs) {
      // Get the salon data.
      Salon salon = salonDoc.data();

      final profileImageName = salon.logo;
      final profileImage = await _getProfileImage(profileImageName, salon.id);
      final images = await _getShots(salon.id);
      final amenities =
          await _getSalonAmenities(salonDoc.get(FC.fSalonAmenities));
      final services = await _getServices(salonDoc.get(FC.fSalonServices));

      // Add a `SalonGroup` object to the list.
      salon = salon.copyWith(
        logo: profileImage,
        images: images,
        amenities: amenities,
        services: services,
      );

      data.add(salon);
    }

    // Return the list of `SalonGroup` objects.
    return data;
  }

  /// Gets a list of salons.
  ///
  /// [params] Optional parameters for filtering the results.
  @override
  Future<List<Salon>> getSalons([GetSalonsParams? params]) async {
    try {
      // Get the collection reference for salons.
      Query<Salon> salonsColRef =
          db.collection(FC.cSalons).withSalonConverter();

      // Filter the salons if necessary.
      salonsColRef = await _filterSalons(salonsColRef, params);

      // Get the snapshot of the filtered salons.
      final snapshot = await salonsColRef.get();

      // Process the salons and amenities concurrently.
      final data = await _processSalons(snapshot);

      return data;
    } catch (e, s) {
      Logger().e("Error", error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<List<Salon>> getTopRatedSalons([GetTopRatedSalonsParams? params]) {
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

  @override
  Future<List<ServicesCategory>> getTPLServiceCategories() async {
    final collectionRef =
        db.collection(FC.cTPLServiceCategories).withServicesCategoryConverter();
    try {
      final snapshot = await collectionRef.get();
      return List.generate(
          snapshot.size, (index) => snapshot.docs[index].data());
    } catch (e, s) {
      Logger().e("Error", error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<List<SalonService>> getTPLServices() async {
    final collectionRef =
        db.collection(FC.cTPLServices).withSalonServiceConverter();
    try {
      final snapshot = await collectionRef.get();
      return List.generate(
          snapshot.size, (index) => snapshot.docs[index].data());
    } catch (e, s) {
      Logger().e("Error", error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<List<Salon>> search([SalonSearchParams? params]) async {
    // Create a query to fetch the salons from Firebase.
    Query<Salon> query = db.collection(FC.cSalons).withSalonConverter();

    // Add filters to the query based on the search parameters.
    if (params?.name != null) {
      query = query.where('name', isEqualTo: params?.name);
    }
    // if (params?.location != null) {
    //   query = query.where('locations', arrayContains: params?.location);
    // }
    if (params?.minRating != null) {
      query = query.where('rating_average',
          isGreaterThanOrEqualTo: params?.minRating);
    }
    // if (params?.services != null) {
    //   query = query.where('services', arrayContainsAny: params?.services);
    // }

    final snapshot = await query.get();
    final salons = _processSalons(snapshot);

    return salons;
  }
}
