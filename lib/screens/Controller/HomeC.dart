import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeC extends GetxController{
  TextEditingController postController = TextEditingController();
  PlatformFile? pickedFile;

  PlatformFile? get getPickedFile => pickedFile;

  void CreatePost(){
    if (postController.text.isNotEmpty){
      User? user = FirebaseAuth.instance.currentUser;

      FirebaseFirestore.instance.collection('Posts').add({
        'UserMail' : user!.email,
        'Message' : postController.text,
        'TimeStamp' : Timestamp.now()
      });

      postController.clear();
    }
  }

  Future SelectFile() async{
    final res = await FilePicker.platform.pickFiles();

    if (res != null){
      pickedFile =  res.files.first;
    }
  }

  void ClearFile(){
    pickedFile = null;
  }
}