import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snapjam/constants/ConstantColors.dart';

class PostWidget extends StatelessWidget {
  final String user;
 // final String timeStamp;
  final String message;

  final ConstantColors cc = ConstantColors();

  PostWidget({
    super.key,
    required this.user,
   // required this.timeStamp,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cc.blueGreyColor,
        borderRadius: BorderRadius.circular(10)
      ),
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
      padding: const EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.circle_rounded, size: 32,),
          SizedBox(width: 8,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5,),
              Text(user, style: TextStyle(color: cc.lightBlueColor),),
              SizedBox(height: 8,),
              Text(message, style: TextStyle(color: cc.whiteColor),),

            ],
          ),
      //    SizedBox(width: 80,),
          const Spacer(),
          Column(
            children: [
              Icon(Icons.thumb_up_alt_rounded, size: 28, color: cc.greyColor,),
              SizedBox(height: 18,),
              Icon(Icons.comment_rounded, size: 28, color: cc.greenColor,),

            ],
          ),
        ],
      ),
    );
  }
}
