import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants/ConstantColors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Constantcolors cc = Constantcolors();

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
