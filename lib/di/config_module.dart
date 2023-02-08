import 'package:base/core/config/app_config.dart';
import 'package:base/core/config/app_config_type.dart';

mixin ConfigModule {
  /// App config
  AppConfigType get appConfig {
    return AppConfig.shared;
  }
}
