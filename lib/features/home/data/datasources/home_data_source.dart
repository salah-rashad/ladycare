import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/error/exceptions.dart';
import '../models/highlight_model.dart';
import '../models/service_category_model.dart';

abstract class HomeDataSource {
  Future<List<HighlightModel>> getHighlights();
  Future<List<ServiceCategoryModel>> getServiceCategories();
}

class HomeDataSourceImpl implements HomeDataSource {
  final FirebaseFirestore db;
  final FirebaseStorage storage;
  HomeDataSourceImpl(this.db, this.storage);

  @override
  Future<List<HighlightModel>> getHighlights() async {
    try {
      final collectionRef = db
          .collection(FirebaseConstants.highlightsCollection)
          .withHighlightModelConverter();
      final snapshot = await collectionRef.get();
      return List.generate(
        snapshot.size,
        (index) => snapshot.docs[index].data(),
      );
    } catch (e) {
      throw DatabaseReadException();
    }
  }

  @override
  Future<List<ServiceCategoryModel>> getServiceCategories() async {
    try {
      final collectionRef = db
          .collection(FirebaseConstants.serviceCategoriesCollection)
          .withServiceCategoryModelConverter();
      final snapshot = await collectionRef.get();
      final List<ServiceCategoryModel> items = [];
      for (var doc in snapshot.docs) {
        final obj = doc.data();
        final iconRef = storage.ref(obj.iconUrl);

        ServiceCategoryModel item = obj;
        try {
          final downloadUrl = await iconRef.getDownloadURL();
          item = obj.copyWith(iconUrl: downloadUrl);
        } catch (e) {
          //
        }
        items.add(item);
      }
      return items;
    } catch (e) {
      log("Error", error: e);
      throw DatabaseReadException();
    }
  }
}
