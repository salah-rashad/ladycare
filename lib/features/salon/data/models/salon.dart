import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'work_days.dart';

part 'salon.freezed.dart';
part 'salon.g.dart';

@freezed
class Salon with _$Salon {
  const factory Salon({
    required String id,
    required String name,
    required String description,
    required String profileImageUrl,
    required List<String> locations,
    required List<String> shots,
    required WorkDays workDays,
    required double ratingAverage,
  }) = _Salon;

  factory Salon.fromJson(Map<String, dynamic> json) => _$SalonFromJson(json);
}

extension SalonColRefExt on CollectionReference<Map<String, dynamic>> {
  CollectionReference<Salon> withSalonConverter() {
    return withConverter(
      fromFirestore: (snapshot, options) {
        final data = snapshot.data()!;
        data["id"] = snapshot.id;
        return Salon.fromJson(data);
      },
      toFirestore: (value, options) => value.toJson(),
    );
  }
}
