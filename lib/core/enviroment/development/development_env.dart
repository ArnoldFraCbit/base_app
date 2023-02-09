import 'package:base/core/enviroment/environment.dart';

extension DevelopmentEnvironment on Environment {
  static Environment development() {
    return Environment(
      baseDomain: 'https://api.loginradius.com/identity/v2/auth/account',
      certificationDomain: '',
      iv: '',
      encriptionKey: '',
    );
  }
}
