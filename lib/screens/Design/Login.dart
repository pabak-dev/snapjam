import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapjam/screens/Controller/LoginC.dart';
import '../../constants/ConstantColors.dart';

class Login extends StatelessWidget {
  final ConstantColors cc = ConstantColors();
  final c = Get.put(LoginC());

  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: cc.whiteColor,
        body: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            cc.bodyColor(),
            SingleChildScrollView(
              child: Column(children: [
                const SizedBox(height: 175),
                Transform.scale(scale: 2.0, child: cc.IconSJ()),
                const SizedBox(height: 275),
                Column(children: [
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: c.email,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          labelText: "Enter E-mail",
                          labelStyle: TextStyle(color: cc.whiteColor),
                          prefixIcon: const Icon(Icons.alternate_email_rounded),
                          prefixIconColor: cc.greenColor,
                          fillColor: cc.blueGreyColor,
                          filled: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: c.pass,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        labelText: "Enter Password",
                        labelStyle: TextStyle(color: cc.whiteColor),
                        prefixIcon: const Icon(Icons.password_rounded),
                        prefixIconColor: cc.greenColor,
                        fillColor: cc.blueGreyColor,
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
                                    (states) => cc.darkColor),
                            foregroundColor: MaterialStateColor.resolveWith(
                                    (states) => cc.greenColor)),
                        onPressed: () {
                          c.OnLogin();
                        },
                        child: Text("Log In")),
                  ),
                ])
              ]),
            )
          ],
        ));
    }
}
