import 'package:get/get.dart';

import 'package:zineb_el_chat/app/modules/chat/bindings/chat_binding.dart';
import 'package:zineb_el_chat/app/modules/chat/views/chat_view.dart';
import 'package:zineb_el_chat/app/modules/home/bindings/home_binding.dart';
import 'package:zineb_el_chat/app/modules/home/views/home_view.dart';
import 'package:zineb_el_chat/app/modules/login_and_signup/bindings/login_and_signup_binding.dart';
import 'package:zineb_el_chat/app/modules/login_and_signup/views/login_and_signup_view.dart';
import 'package:zineb_el_chat/app/modules/splash/bindings/splash_binding.dart';
import 'package:zineb_el_chat/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

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
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => ChatView(),
      binding: ChatBinding(),
    ),
  ];
}
