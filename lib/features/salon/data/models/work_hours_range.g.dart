// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_hours_range.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WorkHoursRange _$$_WorkHoursRangeFromJson(Map<String, dynamic> json) =>
    _$_WorkHoursRange(
      start: const TimeOfDayConverter()
          .fromJson(json['start'] as Map<String, dynamic>),
      end: const TimeOfDayConverter()
          .fromJson(json['end'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_WorkHoursRangeToJson(_$_WorkHoursRange instance) =>
    <String, dynamic>{
      'start': const TimeOfDayConverter().toJson(instance.start),
      'end': const TimeOfDayConverter().toJson(instance.end),
    };
