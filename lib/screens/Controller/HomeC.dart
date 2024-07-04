import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeC extends GetxController{
  TextEditingController postController = TextEditingController();
  PlatformFile? pickedFile;

  PlatformFile? get getPickedFile => pickedFile;

  UploadTask? task;
  double get getUploadProgress => (task!.snapshot.bytesTransferred * 100.0 / task!.snapshot.totalBytes);


  Future CreatePost() async{
    if (postController.text.isNotEmpty){
      User? user = FirebaseAuth.instance.currentUser;

      String url = await UploadFile();

      FirebaseFirestore.instance.collection('Posts').add({
        'UserMail' : user!.email,
        'Message' : postController.text,
        'TimeStamp' : Timestamp.now(),
        'FileURL' : url,
        'Likes': []
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

  Future UploadFile() async{
    if (pickedFile == null) return 'null';

    final file = File(pickedFile!.path!);
    final path = 'files1/${'${pickedFile!.name} ${Timestamp.now()}'}';

    final ref = FirebaseStorage.instance.ref().child(path);
    task = ref.putFile(file);


    await task!.whenComplete(() => pickedFile = null);
    return ref.getDownloadURL();
  }

  void HandleLike(String docName) async{
    DocumentReference docRef = FirebaseFirestore.instance.collection('Posts').doc(docName);
    DocumentSnapshot doc = await docRef.get();
    User? user = FirebaseAuth.instance.currentUser;

    List<String> likes = List<String>.from(doc['Likes'] as List);
    bool liked = false;

    for (String mail in likes){
      if (mail == user!.email){
        liked = true;
        break;
      }
    }

    if (liked){
      likes.remove(user!.email);
    }
    else{
      likes.add(user!.email ?? 'null');
    }

    docRef.update({
      'Likes' : likes
    });
  }

  bool getLikeStatus(List<String> likes){
    User? user = FirebaseAuth.instance.currentUser;
    bool liked = false;

    for (String mail in likes){
      if (mail == user!.email){
        liked = true;
        break;
      }
    }

    return liked;
  }

  void deletePost(String docName) {
    DocumentReference docRef = FirebaseFirestore.instance.collection('Posts').doc(docName);

    FirebaseFirestore.instance.runTransaction((Transaction transaction) async {
      transaction.delete(docRef);
      return;
    });
  }
}