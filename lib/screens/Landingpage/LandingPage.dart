import 'package:flutter/material.dart';
import 'package:snapjam/constants/ConstantColors.dart';
import 'package:snapjam/screens/SplashScreen.dart';

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
          bodyColor(),
          Column(
            children : [
              const SizedBox(height: 175),
              Transform.scale(
                scale: 2.0,
                child: cc.IconSJ()
              )
            ]
          )
        ],
      )
    );
  }

  bodyColor() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.5, 0.9],
              colors: [cc.darkColor, cc.lightBlueColor]
          )
      ),
    );
  }
}
