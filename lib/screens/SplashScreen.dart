import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapjam/screens/Landingpage/LandingPage.dart';
import '../constants/ConstantColors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    Timer(
        Duration(
            seconds: 1
        ),
        (){
          Get.to(LandingPage());
        }
    );
    super.initState();
  }

  ConstantColors cc = ConstantColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cc.darkColor,
      body: Center(
        child: cc.IconSJ(),
      ),
    );
  }


}
