import 'package:base/core/api/error/failure.dart';
import 'package:base/data/models/requests/user_request.dart';
import 'package:base/domain/contracts/repositories/abstract_sing_in_services.dart';
import 'package:base/domain/entities/sign_in.dart';
import 'package:base/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

class GetSignIn {
  final AbstractSignInRepository _signIn;

  GetSignIn({required AbstractSignInRepository signIn}) : _signIn = signIn;
  Future<Either<Failure, SignIn>> call(User user) async {
    return _signIn(UserRequest(newUser: user.user, newPass: user.pass));
  }
}
