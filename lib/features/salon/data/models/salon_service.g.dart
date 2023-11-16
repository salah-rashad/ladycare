// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salon_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SalonService _$$_SalonServiceFromJson(Map<String, dynamic> json) =>
    _$_SalonService(
      id: json['id'] as String,
      name: json['name'] as String? ?? "",
      description: json['description'] as String? ?? "",
      duration: json['duration'] == null
          ? Duration.zero
          : Duration(microseconds: json['duration'] as int),
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      category: json['category'] == null
          ? null
          : ServicesCategory.fromJson(json['category'] as Map<String, dynamic>),
      salonId: json['salon_id'] as int,
    );

Map<String, dynamic> _$$_SalonServiceToJson(_$_SalonService instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'duration': instance.duration.inMicroseconds,
      'price': instance.price,
      'category': instance.category?.toJson(),
      'salon_id': instance.salonId,
    };
