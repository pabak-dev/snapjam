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

  @override
  Widget build(BuildContext context) {
    Constantcolors cc = Constantcolors();

    return Scaffold(
      backgroundColor: cc.darkColor,
      body: Center(
        child: RichText(
          text: TextSpan(
            text: 'Snap',
            style: TextStyle(
              color: cc.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 28
            ),
            children: <TextSpan>[
              TextSpan(
                text: "Jam",
                style: TextStyle(
                    color: cc.redColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 28
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
}
