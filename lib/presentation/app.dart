import 'package:base/core/app_global.dart';
import 'package:base/di/bloc_provider.dart';
import 'package:base/di/client_module.dart';
import 'package:base/di/config_module.dart';
import 'package:base/di/repository_module.dart';
import 'package:base/di/service_module.dart';
import 'package:base/di/usecase_module.dart';
import 'package:base/presentation/utils/routers/gen_router.dart';
import 'package:base/presentation/utils/routers/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void app() {
  runApp(const MyApp());

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  ).then((value) => runApp(const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
    with
        ConfigModule,
        ClientModule,
        ServiceModule,
        RepositoryModule,
        UseCaseModule,
        BlocProviders {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        navigatorObservers: [navigationObserver],
        theme: themeData,
        onGenerateRoute: generateRoute,
        navigatorKey: NavigationController.globalNavigatorKey,
      ),
    );
  }
}
