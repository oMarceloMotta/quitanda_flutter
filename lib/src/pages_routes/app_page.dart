import 'package:get/get.dart';
import 'package:greengrocer/src/pages/auth/sign_in_screen.dart';

import '../../splash/splash_screen.dart';
import '../pages/auth/sign_up_screen.dart';
import '../pages/base/base_screen.dart';

abstract class AppPage {
  static final pages = <GetPage>[
    GetPage(page: () => const SplashScreen(), name: PagesRoutes.splashRoute),
    GetPage(page: () => SignInScreen(), name: PagesRoutes.signinRoute),
    GetPage(page: () => SignUpScreen(), name: PagesRoutes.signupRoute),
    GetPage(page: () => const BaseScreen(), name: PagesRoutes.baseRoute),
  ];
}

abstract class PagesRoutes {
  static const String signinRoute = '/singin';
  static const String signupRoute = '/singup';
  static const String splashRoute = '/splash';
  static const String baseRoute = '/';
}
