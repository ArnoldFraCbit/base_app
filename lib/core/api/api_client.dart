import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'abstract_api_client.dart';
import 'interceptor/curl_log.dart';
import 'interceptor/query.dart';

class APIClient {
  static AbstractAPIClient apiClient({
    required String baseDomain,
    String? identityBaseDomain,
    bool disableRequestBodyLogging = false,
    bool ignoreToken = false,
    bool ignoreConnection = false,
    required String authToken,
  }) {
    BaseOptions baseOptions = BaseOptions();
    baseOptions.connectTimeout = 60 * 1000;
    baseOptions.receiveTimeout = 60 * 1000;
    baseOptions.contentType = Headers.jsonContentType;
    baseOptions.responseType = ResponseType.json;

    final dio = Dio(baseOptions);

    if (kDebugMode) {
      dio.interceptors.add(
          CurlLogInterceptor(disableRequestBody: disableRequestBodyLogging));
      dio.interceptors.add(
        QueryInterceptor(
          identityBaseDomain: identityBaseDomain,
          ignoreConnection: ignoreConnection,
          ignoreToken: ignoreToken,
          authToken: authToken,
        ),
      );
    }
    return AbstractAPIClient(dio, baseUrl: baseDomain);
  }
}
