import 'package:flutter/material.dart';
import 'constants/Constantcolors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
