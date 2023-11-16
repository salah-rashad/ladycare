import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'services_category.dart';

part 'salon_service.freezed.dart';
part 'salon_service.g.dart';

@freezed
class SalonService with _$SalonService {
  const factory SalonService({
    required String id,
    @Default("") String name,
    @Default("") String description,
    @Default(Duration.zero) Duration duration,
    @Default(0.0) double price,
    ServicesCategory? category,
    required int salonId,
  }) = _SalonService;

  factory SalonService.fromJson(Map<String, dynamic> json) =>
      _$SalonServiceFromJson(json);
}

extension SalonServiceColRefExt on CollectionReference {
  CollectionReference<SalonService> withSalonServiceConverter() {
    return withConverter(
      fromFirestore: (snapshot, options) {
        final data = snapshot.data()!;
        data['id'] = snapshot.id;
        return SalonService.fromJson(data);
      },
      toFirestore: (value, options) => value.toJson(),
    );
  }
}

extension SalonServiceDocRefExt on DocumentReference {
  DocumentReference<SalonService> withSalonServiceConverter() {
    return withConverter(
      fromFirestore: (snapshot, options) {
        final data = snapshot.data()!;
        data['id'] = snapshot.id;
        return SalonService.fromJson(data);
      },
      toFirestore: (value, options) => value.toJson(),
    );
  }
}
