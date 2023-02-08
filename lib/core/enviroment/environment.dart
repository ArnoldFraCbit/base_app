import 'package:base/core/enviroment/development/development_env.dart';
import 'package:base/core/enviroment/production/production_env.dart';

class Environment {
  /// Prod environment
  factory Environment.production() {
    return ProductionEnvironment.production();
  }

  /// Dev environment
  factory Environment.development() {
    return DevelopmentEnvironment.development();
  }

  Environment({
    required this.baseDomain,
    required this.certificationDomain,
    required this.iv,
    required this.encriptionKey,
  });

  final String baseDomain;
  final String certificationDomain;
  final String iv;
  final String encriptionKey;
}
