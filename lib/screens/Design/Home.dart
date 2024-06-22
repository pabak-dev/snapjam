import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapjam/screens/Controller/Authentication.dart';
import '../../constants/ConstantColors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    ConstantColors cc = ConstantColors();
    var auth = Get.put(Authentication());

    return Scaffold(
      backgroundColor: cc.darkColor,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: cc.IconSJ(),
        ),
        Center(child: Text(auth.getMail, style: TextStyle(color: cc.whiteColor, fontSize: 18)))
      ]),
    );
  }
}
