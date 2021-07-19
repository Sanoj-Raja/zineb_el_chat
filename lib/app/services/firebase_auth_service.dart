import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:zineb_el_chat/app/core/utils/firebase_error_formatter.dart';
import 'package:zineb_el_chat/app/data/local_storage/sessions.dart';
import 'package:zineb_el_chat/app/routes/app_pages.dart';

class FirebaseAuthService {
  static final auth = FirebaseAuth.instance;

  static void signUp(email, password) {
    auth
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then(
      (newUser) {
        print('This is display name ==> ${newUser.user.displayName}.');
        if (newUser != null) Get.offNamed(Routes.HOME);
      },
    ).onError(
      (error, stackTrace) {
        print('This is error ==> $error.');
        Get.snackbar(
          FirebaseErrorFormatter.format(error['errorTitle']),
          FirebaseErrorFormatter.format(error['errorMessage']),
        );
      },
    );
  }

  static void login(email, password) {
    auth
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then(
      (user) {
        if (user != null) Get.offNamed(Routes.HOME);
      },
    ).onError(
      (error, stackTrace) {
        print('This is error ==> $error');
        Get.snackbar(
          FirebaseErrorFormatter.format(error['errorTitle']),
          FirebaseErrorFormatter.format(error['errorMessage']),
        );
      },
    );
  }

  static logout() {
    auth.signOut().then(
      (_) {
        SessionManager.clearSession();
        Get.offAllNamed(Routes.SPLASH);
      },
    ).onError(
      (error, stackTrace) {
        Get.snackbar(
          FirebaseErrorFormatter.format(error['errorTitle']),
          FirebaseErrorFormatter.format(error['errorMessage']),
        );
      },
    );
  }
}
