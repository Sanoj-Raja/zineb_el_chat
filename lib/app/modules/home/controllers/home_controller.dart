import 'package:get/get.dart';
import 'package:zineb_el_chat/app/services/firebase_auth_service.dart';

class HomeController extends GetxController {
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

  void logoutUser() {
    FirebaseAuthService.logout();
  }
}
