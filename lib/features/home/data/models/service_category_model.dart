import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/service_category.dart';

class ServiceCategoryModel extends ServiceCategory {
  ServiceCategoryModel({
    required super.id,
    required super.iconUrl,
    required super.name,
  });

  ServiceCategoryModel copyWith({
    int? id,
    String? iconUrl,
    String? name,
  }) {
    return ServiceCategoryModel(
      id: id ?? this.id,
      iconUrl: iconUrl ?? this.iconUrl,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'iconUrl': iconUrl,
      'name': name,
    };
  }

  factory ServiceCategoryModel.fromMap(Map<String, dynamic> map) {
    return ServiceCategoryModel(
      id: map['id']?.toInt() ?? 0,
      iconUrl: map['iconUrl'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceCategoryModel.fromJson(String source) =>
      ServiceCategoryModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ServiceCategory(id: $id, iconUrl: $iconUrl, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ServiceCategory &&
        other.id == id &&
        other.iconUrl == iconUrl &&
        other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ iconUrl.hashCode ^ name.hashCode;
}

extension ServiceCategoryModelColRefExt
    on CollectionReference<Map<String, dynamic>> {
  CollectionReference<ServiceCategoryModel>
      withServiceCategoryModelConverter() {
    return withConverter(
      fromFirestore: (snapshot, options) =>
          ServiceCategoryModel.fromMap(snapshot.data()!),
      toFirestore: (value, options) => value.toMap(),
    );
  }
}
