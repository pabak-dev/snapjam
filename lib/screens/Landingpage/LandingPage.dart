import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapjam/constants/ConstantColors.dart';
import 'package:snapjam/screens/Design/Register.dart';
import '../Design/Login.dart';

class LandingPage extends StatelessWidget {
  final Constantcolors cc = Constantcolors();

  LandingPage({super.key});

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
              const SizedBox(height: 375),
              Column(children: [
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => cc.blueGreyColor),
                          foregroundColor: MaterialStateColor.resolveWith(
                              (states) => cc.greenColor)),
                      onPressed: () {
                        Get.to(Login());
                      },
                      child: Text("Log In")),
                ),
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => cc.whiteColor),
                          foregroundColor: MaterialStateColor.resolveWith(
                              (states) => cc.blueGreyColor)),
                      onPressed: () {
                        Get.to(Register());
                      },
                      child: Text("Create New Account")),
                )
              ])
            ])
          ],
        ));
  }
}
