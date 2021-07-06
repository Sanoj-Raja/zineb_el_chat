import 'package:get/get.dart';
import 'package:zineb_el_chat/app/routes/app_pages.dart';

class SplashController extends GetxController {
  RxBool isUserLogedIn = false.obs;
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(milliseconds: 2500)).then(
      (_) {
        if (isUserLogedIn.value)
          Get.offAndToNamed(Routes.HOME);
        else
          Get.toNamed(Routes.LOGIN_AND_SIGNUP);
      },
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
