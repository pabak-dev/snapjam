import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants/ConstantColors.dart';
import '../Controller/RegisterC.dart';

class Register extends StatelessWidget {
  Constantcolors cc = Constantcolors();

  @override
  Widget build(BuildContext context) {
    TextEditingController fName = TextEditingController();
    TextEditingController lName = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController pass = TextEditingController();

    return Scaffold(
        backgroundColor: cc.whiteColor,
        body: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            cc.bodyColor(),
            Column(children: [
              const SizedBox(height: 175),
              Transform.scale(scale: 2.0, child: cc.IconSJ()),
              const SizedBox(height: 150),
              Column(children: [
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: fName,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "Enter your first name",
                      fillColor: cc.whiteColor,
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: lName,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "Enter your last name",
                      fillColor: cc.whiteColor,
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 20),
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
                    controller: pass,
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
                        RegisterC.OnRegister(fName.text, lName.text, email.text, pass.text);
                      },
                      child: Text("Log In")),
                ),
              ])
            ])
          ],
        ));
  }
}
