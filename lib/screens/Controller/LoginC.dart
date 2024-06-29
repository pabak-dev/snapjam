import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapjam/screens/Controller/Authentication.dart';
import '../Design/Home.dart';

class LoginC extends GetxController{
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  final auth = Get.put(Authentication());

  void OnLogin(){
    auth.LogIntoAccount(email.text, pass.text).whenComplete((){
      if (auth.userId != '-1'){
        email.clear();
        pass.clear();

        Get.offAll(const Home());
      }
    });
  }
}
