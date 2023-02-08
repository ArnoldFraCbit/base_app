import 'package:base/core/api/error/failure.dart';
import 'package:base/data/models/requests/user_request.dart';
import 'package:base/data/models/responses/sign_in_response.dart';
import 'package:dartz/dartz.dart';

abstract class AbstractSignInRepository {
  Future<Either<Failure, SignInResponse>> call(UserRequest request);
}
