// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_hours_range.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WorkHoursRange _$$_WorkHoursRangeFromJson(Map<String, dynamic> json) =>
    _$_WorkHoursRange(
      start: _$JsonConverterFromJson<Map<String, dynamic>, TimeOfDay>(
          json['start'], const TimeOfDayConverter().fromJson),
      end: _$JsonConverterFromJson<Map<String, dynamic>, TimeOfDay>(
          json['end'], const TimeOfDayConverter().fromJson),
    );

Map<String, dynamic> _$$_WorkHoursRangeToJson(_$_WorkHoursRange instance) =>
    <String, dynamic>{
      'start': _$JsonConverterToJson<Map<String, dynamic>, TimeOfDay>(
          instance.start, const TimeOfDayConverter().toJson),
      'end': _$JsonConverterToJson<Map<String, dynamic>, TimeOfDay>(
          instance.end, const TimeOfDayConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
