import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/user_data.dart';

part 'user_data_model.g.dart';

@JsonSerializable()
class UserDataModel extends UserData {
  const UserDataModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.profilePictureUrl,
    required super.phoneNumber,
    required super.dateOfBirth,
  });

  Map<String, dynamic> toJson() => _$UserDataModelToJson(this);

  factory UserDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserDataModelFromJson(json);
}

extension UserDataModelColRefExt on CollectionReference<Map<String, dynamic>> {
  CollectionReference<UserDataModel> withUserDataModelConverter() {
    return withConverter(
      fromFirestore: (snapshot, options) {
        final data = snapshot.data()!;
        data.update("id", (value) => snapshot.id);
        final model = UserDataModel.fromJson(data);
        return model;
      },
      toFirestore: (value, options) => value.toJson(),
    );
  }
}
