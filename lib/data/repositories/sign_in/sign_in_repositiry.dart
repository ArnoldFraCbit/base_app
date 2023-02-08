import 'package:base/core/api/error/failure.dart';
import 'package:base/core/app_mixin.dart';
import 'package:base/data/models/responses/sign_in_response.dart';
import 'package:base/data/models/requests/user_request.dart';
import 'package:base/domain/contracts/repositories/abstract_sing_in_services.dart';
import 'package:base/domain/contracts/services/abstract_sing_in_services.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SignInRepository
    with ConnectivityMixin
    implements AbstractSignInRepository {
  final AbstractSignInServices _signIn;

  SignInRepository({required AbstractSignInServices signIn}) : _signIn = signIn;
  @override
  Future<Either<Failure, SignInResponse>> call(UserRequest request) async {
    if (await isInConnection()) {
      try {
        final client = await _signIn(request);
        return Right(client);
      } on DioError catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    }
    return const Left(NoConnectionFailure());
  }
}
