import 'package:base/core/api/abstract_api_client.dart';
import 'package:base/data/models/responses/sign_in_response.dart';
import 'package:base/data/models/requests/user_request.dart';
import 'package:base/domain/contracts/services/abstract_sing_in_services.dart';
import 'package:dio/dio.dart';

class SignInServices implements AbstractSignInServices {
  final AbstractAPIClient _apiClient;

  SignInServices({required AbstractAPIClient apiClient})
      : _apiClient = apiClient;
  @override
  Future<SignInResponse> call(UserRequest request) async {
    final client = await _apiClient.postSignIn(request);
    if (client.response.statusCode == 200) {
      return client.data;
    }
    throw DioError(requestOptions: client.response.requestOptions);
  }
}
