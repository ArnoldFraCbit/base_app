part of 'sign_in_bloc.dart';

abstract class SignInEvent {}

class SignInSubmitted extends SignInEvent {
  final User resquest;
  SignInSubmitted({required this.resquest});
}
