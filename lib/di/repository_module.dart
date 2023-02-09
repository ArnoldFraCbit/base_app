import 'package:base/data/repositories/sign_in/sign_in_repositiry.dart';
import 'package:base/domain/contracts/repositories/abstract_sing_in_services.dart';

import 'service_module.dart';

mixin RepositoryModule on ServiceModule {
  AbstractSignInRepository get signInRepository {
    return SignInRepository(signIn: signInService);
  }
}
