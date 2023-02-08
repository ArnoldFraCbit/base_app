import 'package:base/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_request.g.dart';

@JsonSerializable(explicitToJson: true)
class UserRequest extends User {
  UserRequest({required this.newUser, required this.newPass})
      : super(user: newPass, pass: newPass);

  @JsonKey(name: 'user')
  final String newUser;

  @JsonKey(name: 'pass')
  final String newPass;

  factory UserRequest.fromJson(Map<String, dynamic> json) =>
      _$UserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserRequestToJson(this);
}
