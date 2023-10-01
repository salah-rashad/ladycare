// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_days.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WorkDays _$$_WorkDaysFromJson(Map<String, dynamic> json) => _$_WorkDays(
      sunday: json['sunday'] == null
          ? null
          : WorkHoursRange.fromJson(json['sunday'] as Map<String, dynamic>),
      monday: json['monday'] == null
          ? null
          : WorkHoursRange.fromJson(json['monday'] as Map<String, dynamic>),
      tuesday: json['tuesday'] == null
          ? null
          : WorkHoursRange.fromJson(json['tuesday'] as Map<String, dynamic>),
      wednesday: json['wednesday'] == null
          ? null
          : WorkHoursRange.fromJson(json['wednesday'] as Map<String, dynamic>),
      thursday: json['thursday'] == null
          ? null
          : WorkHoursRange.fromJson(json['thursday'] as Map<String, dynamic>),
      friday: json['friday'] == null
          ? null
          : WorkHoursRange.fromJson(json['friday'] as Map<String, dynamic>),
      saturday: json['saturday'] == null
          ? null
          : WorkHoursRange.fromJson(json['saturday'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_WorkDaysToJson(_$_WorkDays instance) =>
    <String, dynamic>{
      'sunday': instance.sunday?.toJson(),
      'monday': instance.monday?.toJson(),
      'tuesday': instance.tuesday?.toJson(),
      'wednesday': instance.wednesday?.toJson(),
      'thursday': instance.thursday?.toJson(),
      'friday': instance.friday?.toJson(),
      'saturday': instance.saturday?.toJson(),
    };
