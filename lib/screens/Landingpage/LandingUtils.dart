import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class LandingUtils with ChangeNotifier {
  final picker = ImagePicker();
  File userPic = Null as File;
  File get getUserAvatar => userPic;
  String userPicUr1 = "";
  String get getUserPicUrl => userPicUr1;
  Future pickUserPic(BuildContext context, ImageSource source) async {
    final pickedUserPic = await picker.pickImage(source: source);
    if (pickedUserPic == null) {
      print("select an image");
    } else {
      //userPic = File(pickedUserPic.path as List<Object>);
    }
    print(pickedUserPic?.path);
    if(userPic != Null)
    {

    }
  }
}
