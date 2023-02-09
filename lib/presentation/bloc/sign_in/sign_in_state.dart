part of 'sign_in_bloc.dart';

abstract class SignInState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {
  final SignIn response;
  SignInSuccess({required this.response});

  @override
  List<Object?> get props => [response];
}

class SignInFailure extends SignInState {
  final String message;
  SignInFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
