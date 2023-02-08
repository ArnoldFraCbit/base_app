import 'package:base/core/enviroment/environment.dart';

extension DevelopmentEnvironment on Environment {
  static Environment development() {
    return Environment(
      baseDomain: '',
      certificationDomain: '',
      iv: '',
      encriptionKey: '',
    );
  }
}
