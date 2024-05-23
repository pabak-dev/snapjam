import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Design/Home.dart';

class LoginC extends GetxController{
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  static void OnLogin(String email, String pass){
    if (GetUtils.isEmail(email) && pass.length >= 6){
      Get.to(Home());
    }
  }
}
