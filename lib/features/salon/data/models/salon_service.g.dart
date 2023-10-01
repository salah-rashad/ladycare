// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salon_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SalonService _$$_SalonServiceFromJson(Map<String, dynamic> json) =>
    _$_SalonService(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      duration: Duration(microseconds: json['duration'] as int),
    );

Map<String, dynamic> _$$_SalonServiceToJson(_$_SalonService instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'duration': instance.duration.inMicroseconds,
    };
