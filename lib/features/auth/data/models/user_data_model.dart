import 'dart:convert';

import '../../domain/entities/user_data.dart';

class UserDataModel extends UserData {
  const UserDataModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.profilePictureUrl,
    required super.phoneCountryCode,
    required super.phoneNumber,
    required super.dateOfBirth,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneCountryCode': phoneCountryCode,
      'phoneNumber': phoneNumber,
      'profilePictureUrl': profilePictureUrl,
      'dateOfBirth': dateOfBirth?.millisecondsSinceEpoch,
    };
  }

  factory UserDataModel.fromMap(Map<String, dynamic> map) {
    return UserDataModel(
      id: map['id'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      phoneCountryCode: map['phoneCountryCode'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      profilePictureUrl: map['profilePictureUrl'],
      dateOfBirth: map['dateOfBirth'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dateOfBirth'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDataModel.fromJson(String source) =>
      UserDataModel.fromMap(json.decode(source));
}
