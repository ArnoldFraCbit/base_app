import 'package:base/data/models/requests/user_request.dart';
import 'package:base/data/models/responses/sign_in_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

part 'abstract_api_client.g.dart';

@RestApi()
abstract class AbstractAPIClient {
  factory AbstractAPIClient(Dio dio, {String baseUrl}) = _AbstractAPIClient;

  @POST('/sign-in')
  Future<HttpResponse<SignInResponse>> postSignIn(@Body() UserRequest request);
}
