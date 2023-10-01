import 'package:equatable/equatable.dart';

class UserData extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String? profilePictureUrl;
  final DateTime? dateOfBirth;

  const UserData({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.profilePictureUrl,
    required this.dateOfBirth,
  });

  factory UserData.empty() => const UserData(
        id: "",
        firstName: "",
        lastName: "",
        email: "",
        phoneNumber: "",
        profilePictureUrl: "",
        dateOfBirth: null,
      );

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        email,
        phoneNumber,
        profilePictureUrl,
        dateOfBirth
      ];
}
