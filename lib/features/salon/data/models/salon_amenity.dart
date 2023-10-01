import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'salon_amenity.freezed.dart';
part 'salon_amenity.g.dart';

@freezed
class SalonAmenity with _$SalonAmenity {

  const factory SalonAmenity({
    required String name,
    required String icon,
  }) = _SalonAmenity;

  factory SalonAmenity.fromJson(Map<String, dynamic> json) => _$SalonAmenityFromJson(json);
}

extension SalonAmenityColRefExt on CollectionReference<Map<String, dynamic>> {
  CollectionReference<SalonAmenity> withSalonAmenityConverter() {
    return withConverter(
      fromFirestore: (snapshot, options) {
        final data = snapshot.data()!;
        data['id'] = snapshot.id;
        return SalonAmenity.fromJson(data);
      },
      toFirestore: (value, options) => value.toJson(),
    );
  }
}
