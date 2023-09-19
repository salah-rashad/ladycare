import 'package:equatable/equatable.dart';

class UserData extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneCountryCode;
  final String phoneNumber;
  final String? profilePictureUrl;
  final DateTime? dateOfBirth;

  const UserData({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneCountryCode,
    required this.phoneNumber,
    required this.profilePictureUrl,
    required this.dateOfBirth,
  });

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        email,
        phoneCountryCode,
        phoneNumber,
        profilePictureUrl,
        dateOfBirth,
      ];

  UserData copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneCountryCode,
    String? phoneNumber,
    String? profilePictureUrl,
    DateTime? dateOfBirth,
  }) {
    return UserData(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneCountryCode: phoneCountryCode ?? this.phoneCountryCode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    );
  }
}
