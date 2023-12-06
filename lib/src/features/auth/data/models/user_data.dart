import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.freezed.dart';
part 'user_data.g.dart';

@freezed
class UserData with _$UserData {
  const factory UserData({
    required String id,
    @Default("") String firstName,
    @Default("") String lastName,
    @Default("") String email,
    @Default("") String phoneNumber,
    @Default("") String profilePictureUrl,
    DateTime? dateOfBirth,
  }) = _UserData;

  factory UserData.empty() => const UserData(id: "");

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}

extension UserDataColRefExt on CollectionReference {
  CollectionReference<UserData> withUserDataConverter() {
    return withConverter(
      fromFirestore: (snapshot, options) {
        final data = snapshot.data()!;
        data['id'] = snapshot.id;
        return UserData.fromJson(data);
      },
      toFirestore: (value, options) => value.toJson(),
    );
  }
}

extension UserDataDocRefExt on DocumentReference {
  DocumentReference<UserData> withUserDataConverter() {
    return withConverter(
      fromFirestore: (snapshot, options) {
        final data = snapshot.data()!;
        data['id'] = snapshot.id;
        return UserData.fromJson(data);
      },
      toFirestore: (value, options) => value.toJson(),
    );
  }
}
