import 'package:base/presentation/pages/request/request_page.dart';
import 'package:base/presentation/pages/scanner/scanner_page.dart';
import 'package:base/presentation/pages/sign_in/sign_in_page.dart';
import 'package:base/presentation/utils/routers/routes.dart';
import 'package:flutter/material.dart';

Route<Object>? generateRoute(RouteSettings settings) {
  final namedRoute = settings.name == '/'
      ? Routes.scanner
      : Routes.values.firstWhere(
          (element) {
            if (settings.name != null) {
              return settings.name! == '/${element.appRoute.name}';
            }
            return false;
          },
          orElse: () => Routes.unknown,
        );

  switch (namedRoute.appRoute) {
    case AppRoute.unknown:
      return _errorRoute();
    case AppRoute.signIn:
      return _buildRoute(settings: settings, screen: const SignInPage());
    case AppRoute.request:
      return _buildRoute(settings: settings, screen: const RequestPage());
    case AppRoute.scanner:
      return _buildRoute(settings: settings, screen: const ScannerPage());
  }
}

Route<Object>? _errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: const Center(
        child: Text('ERROR'),
      ),
    );
  });
}

Route<Object>? _buildRoute(
    {required RouteSettings settings,
    required Widget screen,
    bool fullscreenDialog = false}) {
  return CustomMaterialPageRoute(
    settings: settings,
    fullscreenDialog: fullscreenDialog,
    builder: (context) {
      return screen;
    },
  );
}

class NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  NoAnimationMaterialPageRoute({
    required WidgetBuilder builder,
    required RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
          builder: builder,
          maintainState: maintainState,
          settings: settings,
          fullscreenDialog: fullscreenDialog,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }
}

class FadePageRoute<T> extends PageRoute<T> {
  final Widget child;

  FadePageRoute(this.child);

  @override
  Color get barrierColor => Colors.black;

  @override
  String get barrierLabel => '';

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 700);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}

class CustomMaterialPageRoute<T> extends MaterialPageRoute<T> {
  @override
  @protected
  bool get hasScopedWillPopCallback {
    return false;
  }

  CustomMaterialPageRoute({
    required WidgetBuilder builder,
    required RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
          builder: builder,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
        );
}
