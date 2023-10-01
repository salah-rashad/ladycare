import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'salon_service.freezed.dart';
part 'salon_service.g.dart';

@freezed
class SalonService with _$SalonService {
  const factory SalonService({
    required String id,
    required String name,
    required String description,
    required double price,
    required Duration duration,
  }) = _SalonService;

  factory SalonService.fromJson(Map<String, dynamic> json) =>
      _$SalonServiceFromJson(json);
}

extension SalonServiceColRefExt on CollectionReference<Map<String, dynamic>> {
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
