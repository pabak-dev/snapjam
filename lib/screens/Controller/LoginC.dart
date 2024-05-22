import 'package:get/get.dart';
import '../Design/Home.dart';

class LoginC {
  static void OnLogin(String email, String pass){
    if (GetUtils.isEmail(email) && pass.length >= 6){
      Get.to(Home());
    }
  }
}
