import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/serialization/time_of_day_converter.dart';

part 'work_hours_range.freezed.dart';
part 'work_hours_range.g.dart';

@freezed
class WorkHoursRange with _$WorkHoursRange {
  const factory WorkHoursRange({
    @TimeOfDayConverter() TimeOfDay? start,
    @TimeOfDayConverter() TimeOfDay? end,
  }) = _WorkHoursRange;

  factory WorkHoursRange.fromJson(Map<String, dynamic> json) =>
      _$WorkHoursRangeFromJson(json);
}

extension WorkHoursRangeColRefExt on CollectionReference {
  CollectionReference<WorkHoursRange> withWorkHoursRangeConverter() {
    return withConverter(
      fromFirestore: (snapshot, options) =>
          WorkHoursRange.fromJson(snapshot.data()!),
      toFirestore: (value, options) => value.toJson(),
    );
  }
}

extension WorkHoursRangeDocRefExt on DocumentReference {
  DocumentReference<WorkHoursRange> withWorkHoursRangeConverter() {
    return withConverter(
      fromFirestore: (snapshot, options) =>
          WorkHoursRange.fromJson(snapshot.data()!),
      toFirestore: (value, options) => value.toJson(),
    );
  }
}
