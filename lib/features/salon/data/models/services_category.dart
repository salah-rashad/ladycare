import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'services_category.freezed.dart';
part 'services_category.g.dart';

@freezed
class ServicesCategory with _$ServicesCategory {
  const factory ServicesCategory({
    required String id,
    @Default("") String name,
    @Default("") String iconUrl,
  }) = _ServicesCategory;

  factory ServicesCategory.fromJson(Map<String, dynamic> json) =>
      _$ServicesCategoryFromJson(json);
}

extension ServicesCategoryColRefExt on CollectionReference {
  CollectionReference<ServicesCategory> withServicesCategoryConverter() {
    return withConverter(
      fromFirestore: (snapshot, options) {
        final data = snapshot.data()!;
        data['id'] = snapshot.id;
        return ServicesCategory.fromJson(data);
      },
      toFirestore: (value, options) => value.toJson(),
    );
  }
}

extension ServicesCategoryDocRefExt on DocumentReference {
  DocumentReference<ServicesCategory> withServicesCategoryConverter() {
    return withConverter(
      fromFirestore: (snapshot, options) {
        final data = snapshot.data()!;
        data['id'] = snapshot.id;
        return ServicesCategory.fromJson(data);
      },
      toFirestore: (value, options) => value.toJson(),
    );
  }
}
