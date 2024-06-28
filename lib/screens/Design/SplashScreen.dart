import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapjam/screens/Design/Home.dart';
import 'package:snapjam/screens/Design/LandingPage.dart';
import '../../constants/ConstantColors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    Timer(
        const Duration(
            seconds: 2
        ),
        (){
          if (loggedIn){
            Get.offAll(const Home());
          }
          else {
            Get.offAll(LandingPage());
          }
        }
    );
    super.initState();
  }

  ConstantColors cc = ConstantColors();
  bool loggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cc.darkColor,
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          loggedIn = snapshot.hasData;
          return Center(
            child: cc.IconSJ(),
          );
        },
      ),
    );
  }
}
