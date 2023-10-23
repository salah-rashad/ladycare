// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ServicesCategory _$$_ServicesCategoryFromJson(Map<String, dynamic> json) =>
    _$_ServicesCategory(
      id: json['id'] as String,
      name: json['name'] as String? ?? "",
      iconUrl: json['icon_url'] as String? ?? "",
    );

Map<String, dynamic> _$$_ServicesCategoryToJson(_$_ServicesCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon_url': instance.iconUrl,
    };
