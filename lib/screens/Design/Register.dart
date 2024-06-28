import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapjam/screens/Design/Login.dart';
import '../../constants/ConstantColors.dart';
import '../Controller/RegisterC.dart';

class Register extends StatelessWidget {
  final ConstantColors cc = ConstantColors();
  final c = Get.put(RegisterC());

  Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: cc.whiteColor,
        body: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            cc.bodyColor(),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 175),
                  Transform.scale(scale: 2.0, child: cc.IconSJ()),
                  const SizedBox(height: 115),
                  Column(children: [
                    SizedBox(
                      width: 300,
                      child: TextField(
                        controller: c.fName,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          hintText: "Enter your first name",
                          labelText: "Enter first name",
                          labelStyle: TextStyle(color: cc.greyColor),
                          prefixIcon: const Icon(Icons.account_circle_rounded),
                          prefixIconColor: cc.greenColor,
                          fillColor: cc.blueGreyColor,
                          filled: true,
                        ),
                        style: TextStyle(
                            color: cc.whiteColor
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        controller: c.lName,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          hintText: "Enter your last name",
                          labelText: "Enter last name",
                          labelStyle: TextStyle(color: cc.greyColor),
                          prefixIcon: const Icon(Icons.account_circle_rounded),
                          prefixIconColor: cc.greenColor,
                          fillColor: cc.blueGreyColor,
                          filled: true,
                        ),
                        style: TextStyle(
                            color: cc.whiteColor
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
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
                    const SizedBox(height: 10),
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
                            color: cc.whiteColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      width: 300,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                      (states) => cc.darkColor),
                              foregroundColor: MaterialStateColor.resolveWith(
                                      (states) => cc.greenColor)),
                          onPressed: () {
                            c.OnRegister();
                          },
                          child: const Text("Register")),
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account? ", style: TextStyle(color: cc.whiteColor),),
                        GestureDetector(
                          child: const Text("Login now!", style: TextStyle(color: Colors.black),),
                          onTap: (){
                            Get.to(Login());
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
