import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapjam/screens/Controller/LoginC.dart';
import 'package:snapjam/screens/Design/Register.dart';
import '../../constants/ConstantColors.dart';

class Login extends StatelessWidget {

  Login({super.key});

  final ConstantColors cc = ConstantColors();

  final c = Get.put(LoginC());

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
                const SizedBox(height: 240),
                Column(children: [
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: c.email,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                          labelText: "Enter E-mail",
                          labelStyle: TextStyle(color: cc.greyColor),
                          prefixIcon: const Icon(Icons.alternate_email_rounded),
                          prefixIconColor: cc.greenColor,
                          fillColor: cc.blueGreyColor,
                          filled: true,

                      ),
                      style: TextStyle(
                        color: cc.whiteColor
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      obscureText: true,
                      controller: c.pass,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        labelText: "Enter Password",
                        labelStyle: TextStyle(color: cc.greyColor),
                        prefixIcon: const Icon(Icons.password_rounded),
                        prefixIconColor: cc.greenColor,
                        fillColor: cc.blueGreyColor,
                        filled: true,
                      ),
                      style: TextStyle(
                          color: cc.whiteColor
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
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
                        child: const Text("Log In")),
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account? ", style: TextStyle(color: cc.whiteColor),),
                      GestureDetector(
                        child: const Text("Create one!", style: TextStyle(color: Colors.black),),
                        onTap: (){
                          Get.to(Register());
                        },
                      ),
                    ],
                  )
                ])
              ]),
            )
          ],
        ));
    }
}
