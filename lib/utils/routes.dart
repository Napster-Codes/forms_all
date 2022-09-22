import 'package:forms_and_fields/views/home_page.dart';
import 'package:forms_and_fields/views/registration_page.dart';
import 'package:forms_and_fields/views/splash.dart';
import 'package:get/get.dart';

import '../views/sub_registration_page.dart';

class GetRoutes {
  static const splash = '/';
  static const register = '/register';
  static const sub = '/sub';
  static const home = '/home';

  static var routes = [
    GetPage(name: splash, page: () => const SplashPage()),
    GetPage(name: register, page: () => const RegisterPage()),
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: sub, page: () => const SubRegisterPage()),
  ];
}
