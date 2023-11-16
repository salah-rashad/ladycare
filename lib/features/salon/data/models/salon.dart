import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/serialization/geo_point_converter.dart';
import 'salon_amenity.dart';
import 'salon_service.dart';
import 'work_days.dart';

part 'salon.freezed.dart';
part 'salon.g.dart';

@freezed
class Salon with _$Salon {
  const factory Salon({
    required String id,
    @Default("") String name,
    @Default("") String description,
    @Default("") String logo,
    @GeoPointConverter() GeoPoint? location,
    @Default([]) List<String> images,
    @Default([]) List<SalonService> services,
    @Default([]) List<SalonAmenity> amenities,
    @Default([]) List<String> branches,
    WorkDays? workDays,
    double? ratingAverage,
  }) = _Salon;

  factory Salon.fromJson(Map<String, dynamic> json) => _$SalonFromJson(json);
}

extension SalonColRefExt on CollectionReference {
  CollectionReference<Salon> withSalonConverter() {
    return withConverter(
      fromFirestore: (snapshot, options) {
        final data = snapshot.data()!;
        data['id'] = snapshot.id;
        return Salon.fromJson(data);
      },
      toFirestore: (value, options) => value.toJson(),
    );
  }
}

extension SalonDocRefExt on DocumentReference {
  DocumentReference<Salon> withSalonConverter() {
    return withConverter(
      fromFirestore: (snapshot, options) {
        final data = snapshot.data()!;
        data['id'] = snapshot.id;
        return Salon.fromJson(data);
      },
      toFirestore: (value, options) => value.toJson(),
    );
  }
}
