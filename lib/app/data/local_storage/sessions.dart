import 'package:get_storage/get_storage.dart';

class SessionManager {
  static final userStorage = GetStorage();

  static void clearSession() {
    userStorage.erase();
    print("Session Cleared.");
  }
}
