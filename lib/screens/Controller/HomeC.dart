import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeC extends GetxController{
  TextEditingController postController = TextEditingController();

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
}