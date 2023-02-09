import 'package:base/core/config/app_config.dart';
import 'package:base/core/enviroment/environment.dart';
import 'package:base/presentation/app.dart';

void main() {
  AppConfig(env: Environment.development());
  app();
}
