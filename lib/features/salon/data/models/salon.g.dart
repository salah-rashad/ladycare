// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Salon _$$_SalonFromJson(Map<String, dynamic> json) => _$_Salon(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      profileImageUrl: json['profile_image_url'] as String,
      locations:
          (json['locations'] as List<dynamic>).map((e) => e as String).toList(),
      shots: (json['shots'] as List<dynamic>).map((e) => e as String).toList(),
      workDays: WorkDays.fromJson(json['work_days'] as Map<String, dynamic>),
      ratingAverage: (json['rating_average'] as num).toDouble(),
    );

Map<String, dynamic> _$$_SalonToJson(_$_Salon instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'profile_image_url': instance.profileImageUrl,
      'locations': instance.locations,
      'shots': instance.shots,
      'work_days': instance.workDays.toJson(),
      'rating_average': instance.ratingAverage,
    };
