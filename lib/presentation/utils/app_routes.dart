import 'package:base/presentation/utils/routers/routes.dart';
import 'package:base/presentation/utils/routers/navigation_controller.dart';
import 'package:flutter/material.dart';

extension AppRouter<T extends StatefulWidget> on State<T> {
  void transitionToAuth() {
    NavigationController.push(Routes.signIn.routeName, clean: true);
  }

  void transitionToRequest() {
    NavigationController.push(Routes.request.routeName, clean: true);
  }

  void pop() {
    Navigator.pop(context);
  }
}
