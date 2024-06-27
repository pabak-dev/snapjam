import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:snapjam/screens/Controller/Authentication.dart';
import '../Design/Home.dart';

class RegisterC extends GetxController{
  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  final auth = Get.put(Authentication());

  void OnRegister(){
    if (GetUtils.isEmail(email.text) && pass.text.length >= 6 && fName.text.isNotEmpty && lName.text.isNotEmpty){
      auth.CreateAccount(email.text, pass.text).whenComplete((){
        if (auth.userId != '-1'){
          Get.to(const Home());
        }
      });
    }
  }
}
