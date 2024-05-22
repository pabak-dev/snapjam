import 'package:get/get.dart';
import '../Design/Home.dart';

class RegisterC {
  static void OnRegister(String fName, String lName, String email, String pass){
    if (GetUtils.isEmail(email) && pass.length >= 6 && fName.isNotEmpty && lName.isNotEmpty){
      Get.to(Home());
    }
  }
}
