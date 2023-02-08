import 'package:base/di/usecase_module.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin BlocProviders on UseCaseModule {
  List<BlocProvider> get blocProviders => <BlocProvider>[];
}
