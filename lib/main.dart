import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/SplashScreen.dart';
import 'constants/ConstantColors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    ConstantColors cc = ConstantColors();

    return GetMaterialApp(
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
