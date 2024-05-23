import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapjam/screens/Controller/LoginC.dart';
import '../../constants/ConstantColors.dart';
import 'Register.dart';

class Login extends StatelessWidget {
  Constantcolors cc = Constantcolors();
  var c = Get.put(LoginC());

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        backgroundColor: cc.whiteColor,
        body: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            cc.bodyColor(),
            Column(children: [
              const SizedBox(height: 175),
              Transform.scale(scale: 2.0, child: cc.IconSJ()),
              const SizedBox(height: 275),
              Column(children: [
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: email,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: "Enter E-mail",
                        fillColor: cc.whiteColor,
                        filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: Get.find<LoginC>().pass,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      fillColor: cc.whiteColor,
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => cc.blueGreyColor),
                          foregroundColor: MaterialStateColor.resolveWith(
                                  (states) => cc.greenColor)),
                      onPressed: () {
                        LoginC.OnLogin(email.text, pass.text);
                      },
                      child: Text("Log In")),
                ),
              ])
            ])
          ],
        ));
    }
}
