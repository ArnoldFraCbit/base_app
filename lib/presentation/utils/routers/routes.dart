import 'package:base/presentation/utils/routers/named_route.dart';

enum AppRoute { unknown, signIn, request, scanner }

class Routes {
  static NamedRoute get unknown => NamedRoute(appRoute: AppRoute.unknown);
  static NamedRoute get signIn => NamedRoute(appRoute: AppRoute.signIn);
  static NamedRoute get request => NamedRoute(appRoute: AppRoute.request);
  static NamedRoute get scanner => NamedRoute(appRoute: AppRoute.scanner);

  static List<NamedRoute> values = [
    unknown,
    signIn,
    request,
    scanner,
  ];
}
