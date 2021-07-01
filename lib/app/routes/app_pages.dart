import 'package:get/get.dart';

import 'package:zineb_el_chat/app/modules/home/bindings/home_binding.dart';
import 'package:zineb_el_chat/app/modules/home/views/home_view.dart';
import 'package:zineb_el_chat/app/modules/login_and_signup/bindings/login_and_signup_binding.dart';
import 'package:zineb_el_chat/app/modules/login_and_signup/views/login_and_signup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_AND_SIGNUP,
      page: () => LoginAndSignupView(),
      binding: LoginAndSignupBinding(),
    ),
  ];
}
