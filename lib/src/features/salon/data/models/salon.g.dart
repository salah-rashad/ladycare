// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Salon _$$_SalonFromJson(Map<String, dynamic> json) => _$_Salon(
      id: json['id'] as String,
      name: json['name'] as String? ?? "",
      description: json['description'] as String? ?? "",
      logo: json['logo'] as String? ?? "",
      location: _$JsonConverterFromJson<Map<String, dynamic>, GeoPoint>(
          json['location'], const GeoPointConverter().fromJson),
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      services: (json['services'] as List<dynamic>?)
              ?.map((e) => SalonService.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      amenities: (json['amenities'] as List<dynamic>?)
              ?.map((e) => SalonAmenity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      branches: (json['branches'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      workDays: json['work_days'] == null
          ? null
          : WorkDays.fromJson(json['work_days'] as Map<String, dynamic>),
      ratingAverage: (json['rating_average'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_SalonToJson(_$_Salon instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'logo': instance.logo,
      'location': _$JsonConverterToJson<Map<String, dynamic>, GeoPoint>(
          instance.location, const GeoPointConverter().toJson),
      'images': instance.images,
      'services': instance.services.map((e) => e.toJson()).toList(),
      'amenities': instance.amenities.map((e) => e.toJson()).toList(),
      'branches': instance.branches,
      'work_days': instance.workDays?.toJson(),
      'rating_average': instance.ratingAverage,
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
