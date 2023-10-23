import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'work_hours_range.dart';

part 'work_days.freezed.dart';
part 'work_days.g.dart';

@freezed
class WorkDays with _$WorkDays {
  const factory WorkDays({
    WorkHoursRange? sunday,
    WorkHoursRange? monday,
    WorkHoursRange? tuesday,
    WorkHoursRange? wednesday,
    WorkHoursRange? thursday,
    WorkHoursRange? friday,
    WorkHoursRange? saturday,
  }) = _WorkDays;

  factory WorkDays.fromJson(Map<String, dynamic> json) =>
      _$WorkDaysFromJson(json);
}

extension WorkDaysColRefExt on CollectionReference {
  CollectionReference<WorkDays> withWorkDaysConverter() {
    return withConverter(
      fromFirestore: (snapshot, options) => WorkDays.fromJson(snapshot.data()!),
      toFirestore: (value, options) => value.toJson(),
    );
  }
}

extension WorkDaysDocRefExt on DocumentReference {
  DocumentReference<WorkDays> withWorkDaysConverter() {
    return withConverter(
      fromFirestore: (snapshot, options) => WorkDays.fromJson(snapshot.data()!),
      toFirestore: (value, options) => value.toJson(),
    );
  }
}
