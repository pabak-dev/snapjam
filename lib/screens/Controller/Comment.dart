import 'package:flutter/material.dart';
import '../../constants/ConstantColors.dart';
class Comment extends StatelessWidget {
  final String text;
  final String user;
  final String time;
  final ConstantColors cc = ConstantColors();
  Comment({super.key,
    required this.text,
    required this.user,
    required this.time,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cc.blueGreyColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column
        (
        children: [
          Text(text),
          Row(
            children: [
              Text(user),
              Text("       "),
              Text(time),
            ],
          )
        ],
      )
    );
  }
}
