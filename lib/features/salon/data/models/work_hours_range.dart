import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/serialization/time_of_day_converter.dart';

part 'work_hours_range.freezed.dart';
part 'work_hours_range.g.dart';

@freezed
class WorkHoursRange with _$WorkHoursRange {
  const factory WorkHoursRange({
    @TimeOfDayConverter() required TimeOfDay start,
    @TimeOfDayConverter() required TimeOfDay end,
  }) = _WorkHoursRange;

  factory WorkHoursRange.fromJson(Map<String, dynamic> json) =>
      _$WorkHoursRangeFromJson(json);
}

extension WorkHoursRangeColRefExt on CollectionReference<Map<String, dynamic>> {
  CollectionReference<WorkHoursRange> withWorkHoursRangeConverter() {
    return withConverter(
      fromFirestore: (snapshot, options) =>
          WorkHoursRange.fromJson(snapshot.data()!),
      toFirestore: (value, options) => value.toJson(),
    );
  }
}
