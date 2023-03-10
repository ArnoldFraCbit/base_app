import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class CurlLogInterceptor extends PrettyDioLogger {
  CurlLogInterceptor({bool disableRequestBody = false})
      : super(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          request: true,
          responseHeader: true,
        );
}
