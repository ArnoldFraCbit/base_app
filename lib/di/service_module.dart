import 'package:base/data/services/sign_in/sign_in_service.dart';
import 'package:base/domain/contracts/services/abstract_sing_in_services.dart';

import 'client_module.dart';

mixin ServiceModule on ClientModule {
  AbstractSignInServices get signInService {
    return SignInServices(apiClient: apiClientToken);
  }
}
