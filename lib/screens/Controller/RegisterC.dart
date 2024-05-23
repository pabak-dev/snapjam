import 'package:get/get.dart';
import '../Design/Home.dart';

class RegisterC extends GetxController{
  static void OnRegister(String fName, String lName, String email, String pass){
    if (GetUtils.isEmail(email) && pass.length >= 6 && fName.isNotEmpty && lName.isNotEmpty){
      Get.to(Home());
    }
  }
}
