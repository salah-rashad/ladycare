import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logger/logger.dart';

import '../../../../core/constants/constants.dart';
import '../../../salon/data/models/salon_service.dart';
import '../../../salon/data/models/services_category.dart';
import '../models/highlight.dart';

abstract class HomeDataSource {
  Future<List<Highlight>> getHighlights();
  Future<List<ServicesCategory>> getTPLServiceCategories();
  Future<List<SalonService>> getTPLServices(String categoryId);
}

class HomeDataSourceImpl implements HomeDataSource {
  final FirebaseFirestore db;
  final FirebaseStorage storage;
  HomeDataSourceImpl(this.db, this.storage);

  @override
  Future<List<Highlight>> getHighlights() async {
    try {
      final collectionRef =
          db.collection(FC.cHighlights).withHighlightConverter();
      final snapshot = await collectionRef.get();
      return List.generate(
        snapshot.size,
        (index) => snapshot.docs[index].data(),
      );
    } catch (e, s) {
      Logger().e("Error", error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<List<ServicesCategory>> getTPLServiceCategories() async {
    final colRef =
        db.collection(FC.cTPLServiceCategories).withServicesCategoryConverter();

    try {
      final snapshot = await colRef.get();
      final categories = snapshot.docs.map((doc) async {
        var category = doc.data();
        // fetching and replacing icon storage path to a download url
        final iconRef = storage.ref(category.iconUrl);
        try {
          final downloadUrl = await iconRef.getDownloadURL();
          category = category.copyWith(iconUrl: downloadUrl);
        } catch (e, s) {
          Logger().e("Error", error: e, stackTrace: s);
          rethrow;
        }

        return category;
      });

      final list = Future.wait(categories);
      return list;
    } catch (e, s) {
      Logger().e("Error", error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<List<SalonService>> getTPLServices(String categoryId) async {
    final servicesColRef = db
        .collection(FC.cTPLServiceCategories)
        .doc(categoryId)
        .collection(FC.cTPLServices)
        .withSalonServiceConverter();

    try {
      final snapshot = await servicesColRef.get();
      return List.generate(
        snapshot.size,
        (index) => snapshot.docs[index].data(),
      );
    } catch (e, s) {
      Logger().e("Error", error: e, stackTrace: s);
      rethrow;
    }
  }
}
