// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInResponse _$SignInResponseFromJson(Map<String, dynamic> json) =>
    SignInResponse(
      newToken: json['token'] as String?,
      newName: json['name'] as String?,
      newLastName: json['lastName'] as String?,
      newPhone: json['phone'] as String?,
      newEmail: json['email'] as String?,
    );

Map<String, dynamic> _$SignInResponseToJson(SignInResponse instance) =>
    <String, dynamic>{
      'token': instance.newToken,
      'name': instance.newName,
      'lastName': instance.newLastName,
      'phone': instance.newPhone,
      'email': instance.newEmail,
    };
