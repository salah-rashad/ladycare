import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/error/exceptions.dart';
import '../models/highlight_model.dart';
import '../models/service_category_model.dart';

abstract class HomeDataSource {
  Future<List<HighlightModel>> getHighlights();
  Future<List<ServiceCategoryModel>> getServiceCategories();
}

class HomeDataSourceImpl implements HomeDataSource {
  final FirebaseFirestore db;
  HomeDataSourceImpl(this.db);

  @override
  Future<List<HighlightModel>> getHighlights() async {
    try {
      final collectionRef =
          db.collection("highlights").withHighlightModelConverter();
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
          .collection("service_categories")
          .withServiceCategoryModelConverter();
      final snapshot = await collectionRef.get();
      return List.generate(
        snapshot.size,
        (index) => snapshot.docs[index].data(),
      );
    } catch (e) {
      throw DatabaseReadException();
    }
  }
}
