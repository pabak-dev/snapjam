import 'package:flutter/material.dart';
import '../../constants/ConstantColors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    ConstantColors cc = ConstantColors();

    return Scaffold(
      backgroundColor: cc.darkColor,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: cc.IconSJ(),
        ),
        Center(child: Text("Work in progress", style: TextStyle(color: cc.whiteColor, fontSize: 18)))
      ]),
    );
  }
}
