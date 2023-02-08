import 'package:base/core/api/abstract_api_client.dart';
import 'package:base/core/api/api_client.dart';

import 'config_module.dart';

mixin ClientModule on ConfigModule {
  // API Client
  AbstractAPIClient get apiClientToken {
    return APIClient.apiClient(
      baseDomain: appConfig.baseDomain,
      authToken: appConfig.certificationDomain,
      ignoreToken: false,
    );
  }
}
