import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class LandingUtils with ChangeNotifier{
  final picker = ImagePicker();
  File userPic =Null as File;
  File get getUserAvatar => userPic;
  String userPicUr1 = "";
  String get getUserPicUrl => userPicUr1;
  Future pickUserPic(BuildContext context, ImageSource source) async
  {
    final pickedUserPic = await ImagePicker.getImage(source: source);
    if(pickedUserPic)
      print("select an image");
    else
      userPic = File(pickedUserPic.path);
  }
}