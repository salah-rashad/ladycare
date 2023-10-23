// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Salon _$SalonFromJson(Map<String, dynamic> json) => Salon(
      id: json['id'] as String,
      name: json['name'] as String? ?? "",
      description: json['description'] as String? ?? "",
      profileImageUrl: json['profile_image_url'] as String? ?? "",
      locations: (json['locations'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      shots:
          (json['shots'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      services: json['services'] == null
          ? const []
          : Salon._servicesFromJson(json['services'] as List),
      amenities: json['amenities'] == null
          ? const []
          : Salon._amenitiesFromJson(json['amenities'] as List),
      workDays: json['work_days'] == null
          ? const WorkDays()
          : WorkDays.fromJson(json['work_days'] as Map<String, dynamic>),
      ratingAverage: (json['rating_average'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SalonToJson(Salon instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'profile_image_url': instance.profileImageUrl,
      'locations': instance.locations,
      'shots': instance.shots,
      'services': instance.services.map((e) => e.toJson()).toList(),
      'amenities': instance.amenities.map((e) => e.toJson()).toList(),
      'work_days': instance.workDays.toJson(),
      'rating_average': instance.ratingAverage,
    };
