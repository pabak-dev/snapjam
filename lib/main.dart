import 'package:flutter/material.dart';
import 'SplashScreen.dart';
import 'constants/Constantcolors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Constantcolors cc = Constantcolors();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Freeman',
        secondaryHeaderColor: cc.blueColor,
        canvasColor: Colors.transparent,
      ),
      home: SplashScreen(),
    );
  }
}
