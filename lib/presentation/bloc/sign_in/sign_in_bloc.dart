import 'package:base/core/api/error/failure.dart';
import 'package:base/domain/entities/sign_in.dart';
import 'package:base/domain/entities/user.dart';
import 'package:base/domain/usecase/post_sign_in.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_state.dart';
part 'sign_in_event.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final PostSignIn _postSignIn;

  SignInBloc({required PostSignIn postSignIn})
      : _postSignIn = postSignIn,
        super(SignInLoading()) {
    on<SignInSubmitted>(_onSignIn);
  }

  void _onSignIn(SignInSubmitted event, Emitter<SignInState> emit) async {
    emit(SignInLoading());
    final response = await _postSignIn(event.resquest);
    emit(_failureOrSuccess(response));
  }

  SignInState _failureOrSuccess(Either<Failure, SignIn> response) {
    return response.fold(
      (Failure failure) => SignInFailure(message: mapFailureToMessage(failure)),
      (SignIn response) => SignInSuccess(response: response),
    );
  }
}
