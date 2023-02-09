import 'dart:convert';
import 'package:base/core/config/app_config_mixin.dart';
import 'package:base/core/enviroment/environment.dart';

class AppConfig with AppConfigMixin {
  static final AppConfig shared = AppConfig._instance();

  factory AppConfig({required Environment env}) {
    shared.env = env;
    return shared;
  }

  AppConfig._instance();
  Environment? env;

  @override
  String get baseDomain => env?.baseDomain ?? '';

  @override
  String get certificationDomain =>
      utf8.decode(base64Decode(env!.certificationDomain));

  @override
  String get iv => env?.iv ?? '';

  @override
  String get encriptionKey => env?.encriptionKey ?? '';
}
