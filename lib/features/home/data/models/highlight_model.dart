import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/highlight.dart';

class HighlightModel extends Highlight {
  HighlightModel({
    required super.label,
    required super.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'label': label,
      'imageUrl': imageUrl,
    };
  }

  factory HighlightModel.fromMap(Map<String, dynamic> map) {
    return HighlightModel(
      label: map['label'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory HighlightModel.fromJson(String source) =>
      HighlightModel.fromMap(json.decode(source));
}

extension HighlightModelColRefExt on CollectionReference<Map<String, dynamic>> {
  CollectionReference<HighlightModel> withHighlightModelConverter() {
    return withConverter(
      fromFirestore: (snapshot, options) =>
          HighlightModel.fromMap(snapshot.data()!),
      toFirestore: (value, options) => value.toMap(),
    );
  }
}
