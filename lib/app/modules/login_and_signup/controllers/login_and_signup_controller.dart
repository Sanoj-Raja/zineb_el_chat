import 'package:get/get.dart';
import 'package:zineb_el_chat/app/routes/app_pages.dart';

class LoginAndSignupController extends GetxController {
  RxBool isSignupScreen = true.obs;
  RxBool isMale = true.obs;
  RxBool isRememberMe = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void onArrowButtonPress() {
    Get.toNamed(Routes.HOME);
    print('Arrow Button has been pressed.');
  }
}
