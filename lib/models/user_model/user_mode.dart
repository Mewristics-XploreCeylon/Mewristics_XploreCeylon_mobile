import 'package:json_annotation/json_annotation.dart';

part 'user_mode.g.dart';

@JsonSerializable()
class UserModel {
  final String? username;
  final String? email;
  final String? password;

  const UserModel({
    this.username,
    this.email,
    this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserModelToJson(this);
  }
}
