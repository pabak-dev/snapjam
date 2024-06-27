import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapjam/screens/Controller/Authentication.dart';
import '../Design/Home.dart';

class LoginC extends GetxController{
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  final auth = Get.put(Authentication());

  void OnLogin(){
    if (GetUtils.isEmail(email.text) && pass.text.length >= 6){
      auth.LogIntoAccount(email.text, pass.text).whenComplete((){
        Get.to(const Home());
      });
    }
  }
}
