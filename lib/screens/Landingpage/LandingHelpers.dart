import 'package:flutter/material.dart';
import 'package:snapjam/constants/ConstantColors.dart';

class LandingHelpers with ChangeNotifier{
  final Constantcolors cc = Constantcolors();
  Widget bodyImage(BuildContext context)
  {
    return Container(
      height: MediaQuery.of(context).size.height*0.7,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.brown,
      ),
    );
  }
  Widget taglineText(BuildContext context)
  {
    return Positioned(
      top:450,
      left:15,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 175,
        ),
        child: RichText(
          text: TextSpan(
            text: 'Snap',
            style: TextStyle(
              fontFamily: 'Freeman',
              color: cc.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            )
          )
        )
      )
    );
  }
}