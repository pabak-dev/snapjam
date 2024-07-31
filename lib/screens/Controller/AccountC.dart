import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountC extends GetxController{
  PlatformFile? pickedFile;
  PlatformFile? get getPickedFile => pickedFile;

  UploadTask? task;

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
}