// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserData _$$_UserDataFromJson(Map<String, dynamic> json) => _$_UserData(
      id: json['id'] as String,
      firstName: json['first_name'] as String? ?? "",
      lastName: json['last_name'] as String? ?? "",
      email: json['email'] as String? ?? "",
      phoneNumber: json['phone_number'] as String? ?? "",
      profilePictureUrl: json['profile_picture_url'] as String? ?? "",
      dateOfBirth: json['date_of_birth'] == null
          ? null
          : DateTime.parse(json['date_of_birth'] as String),
    );

Map<String, dynamic> _$$_UserDataToJson(_$_UserData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'profile_picture_url': instance.profilePictureUrl,
      'date_of_birth': instance.dateOfBirth?.toIso8601String(),
    };
