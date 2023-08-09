import 'package:base/di/usecase_module.dart';
import 'package:base/presentation/bloc/sign_in/sign_in_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin BlocModule on UseCaseModule {
  dynamic get blocProviders => [
        BlocProvider(
          create: (context) => SignInBloc(postSignIn: postSignIn),
        ),
      ];
}
