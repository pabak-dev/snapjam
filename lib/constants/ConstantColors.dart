import 'package:flutter/material.dart';
class Constantcolors{
  final Color lightColor = const Color(0xff6c788a);
  final Color darkColor = const Color(0xff100E20);
  final Color blueColor = Colors.lightBlueAccent.shade400;
  final Color lightBlueColor = Colors.lightBlueAccent.shade200;
  final Color redColor  =  Colors.red;
  final Color whiteColor = Colors.white;
  final Color blueGreyColor = Colors.blueGrey.shade900;
  final Color greenColor = Colors.greenAccent;
  final Color yellowColor =  Colors.yellow;
  final Color greyColor = Colors.grey.shade600;

  RichText IconSJ(){
    return RichText(
      text: TextSpan(
          text: 'Snap',
          style: TextStyle(
              color: whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 32
          ),
          children: <TextSpan>[
            TextSpan(
              text: "Jam",
              style: TextStyle(
                  color: redColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 32
              ),
            )
          ]
      ),
    );
  }

  Container bodyColor() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.5, 0.9],
              colors: [darkColor, lightBlueColor])),
    );
  }
}