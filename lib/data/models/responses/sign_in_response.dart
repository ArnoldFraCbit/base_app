import 'package:base/domain/entities/sign_in.dart';
import 'package:json_annotation/json_annotation.dart';
part 'sign_in_response.g.dart';

@JsonSerializable(explicitToJson: true)
class SignInResponse extends SignIn {
  SignInResponse({
    required this.newToken,
    required this.newName,
    required this.newLastName,
    required this.newPhone,
    required this.newEmail,
  }) : super(
          token: newToken ?? '',
          name: newName ?? '',
          lastName: newLastName ?? '',
          phone: newPhone ?? '',
          email: newEmail ?? '',
        );

  @JsonKey(name: 'token')
  final String? newToken;

  @JsonKey(name: 'name')
  final String? newName;

  @JsonKey(name: 'lastName')
  final String? newLastName;

  @JsonKey(name: 'phone')
  final String? newPhone;

  @JsonKey(name: 'email')
  final String? newEmail;

  factory SignInResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignInResponseToJson(this);
}
