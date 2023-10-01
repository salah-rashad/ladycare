import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'work_hours_range.dart';

part 'work_days.freezed.dart';
part 'work_days.g.dart';

@freezed
class WorkDays with _$WorkDays {
  const factory WorkDays({
    required WorkHoursRange? sunday,
    required WorkHoursRange? monday,
    required WorkHoursRange? tuesday,
    required WorkHoursRange? wednesday,
    required WorkHoursRange? thursday,
    required WorkHoursRange? friday,
    required WorkHoursRange? saturday,
  }) = _WorkDays;

  factory WorkDays.fromJson(Map<String, dynamic> json) =>
      _$WorkDaysFromJson(json);
}

extension WorkDaysColRefExt on CollectionReference<Map<String, dynamic>> {
  CollectionReference<WorkDays> withWorkDaysConverter() {
    return withConverter(
      fromFirestore: (snapshot, options) => WorkDays.fromJson(snapshot.data()!),
      toFirestore: (value, options) => value.toJson(),
    );
  }
}
