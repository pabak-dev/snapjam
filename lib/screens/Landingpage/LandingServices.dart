import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snapjam/constants/ConstantColors.dart';
import 'package:snapjam/screens/Landingpage/LandingUtils.dart';

class LandingServices with ChangeNotifier {
  TextEditingController UserEmail = TextEditingController();
  TextEditingController UserName = TextEditingController();
  TextEditingController Userpass = TextEditingController();
  ConstantColors cc = ConstantColors();
  showUserPic(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 150.0),
                  child: Divider(
                    thickness: 4.0,
                    color: cc.whiteColor,
                  ),
                ),
                CircleAvatar(
                  radius: 85.0,
                  //backgroundImage: FileImage(
                  //),
                )
              ],
            ),
            decoration: BoxDecoration(
              color: cc.blueGreyColor,
              borderRadius: BorderRadius.circular(14.0),
            ),
          );
        });
  }
}
