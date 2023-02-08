import 'package:base/data/models/requests/user_request.dart';
import 'package:base/data/models/responses/sign_in_response.dart';

abstract class AbstractSignInServices {
  Future<SignInResponse> call(UserRequest request);
}
