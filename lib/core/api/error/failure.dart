import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({required String message}) : super(message);
}

class NoConnectionFailure extends Failure {
  const NoConnectionFailure() : super('No connection!');
}

class NoAuthenticationFailure extends Failure {
  const NoAuthenticationFailure() : super('Please sign in');
}

String mapFailureToMessage(Failure failure) {
  if (failure is ServerFailure) {
    return failure.message;
  } else if (failure is NoConnectionFailure) {
    return failure.message;
  } else {
    return failure.message;
  }
}
