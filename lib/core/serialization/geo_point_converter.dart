import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class GeoPointConverter
    implements JsonConverter<GeoPoint, Map<String, dynamic>> {
  const GeoPointConverter();

  @override
  GeoPoint fromJson(Map<String, dynamic> json) {
    return GeoPoint(
      json['latitude'] ?? 0.0,
      json['longitude'] ?? 0.0,
    );
  }

  @override
  Map<String, dynamic> toJson(GeoPoint object) {
    return {
      "latitude": object.latitude,
      "longitude": object.longitude,
    };
  }
}
