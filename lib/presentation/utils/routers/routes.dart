import 'package:base/presentation/utils/routers/named_route.dart';

enum AppRoute { unknown, signIn }

class Routes {
  static NamedRoute get unknown => NamedRoute(appRoute: AppRoute.unknown);
  static NamedRoute get signIn => NamedRoute(appRoute: AppRoute.unknown);

  static List<NamedRoute> values = [
    unknown,
    signIn,
  ];
}
