import 'package:base/core/config/app_config.dart';
import 'package:base/core/config/app_config_mixin.dart';

mixin ConfigModule {
  /// App config
  AppConfigMixin get appConfig {
    return AppConfig.shared;
  }
}
