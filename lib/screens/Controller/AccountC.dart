import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class AccountC extends GetxController {
  PlatformFile? pickedFile;
  UploadTask? task;

  Future SelectFile() async {
    final res = await FilePicker.platform.pickFiles();

    if (res != null) {
      pickedFile = res.files.first;
      String url = await UploadFile();

      User? user = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.email)
          .update({'ProfileImage': url});
    }
    ClearFile();
  }

  void ClearFile() {
    pickedFile = null;
  }

  Future UploadFile() async {
    if (pickedFile == null) return 'null';

    final file = File(pickedFile!.path!);
    final path = 'files1/${'${pickedFile!.name} ${Timestamp.now()}'}';

    final ref = FirebaseStorage.instance.ref().child(path);
    task = ref.putFile(file);

    await task!.whenComplete(() => pickedFile = null);
    return ref.getDownloadURL();
  }

  Future FollowToggle(String followMail) async {
    User? user = FirebaseAuth.instance.currentUser;

    DocumentReference docRef =
        FirebaseFirestore.instance.collection('Users').doc(followMail);
    DocumentSnapshot doc = await docRef.get();
    List<String> followers = List<String>.from(doc['Followers'] as List);

    if (followers.contains(user!.email!)) {
      followers.remove(user.email!);
    } else {
      followers.add(user.email!);
    }

    await FirebaseFirestore.instance
        .collection('Users')
        .doc(followMail)
        .update({'Followers': followers});

    docRef = FirebaseFirestore.instance.collection('Users').doc(user.email!);
    doc = await docRef.get();
    List<String> following = List<String>.from(doc['Following'] as List);

    if (following.contains(followMail)) {
      following.remove(followMail);
    } else {
      following.add(followMail);
    }

    await FirebaseFirestore.instance
        .collection('Users')
        .doc(user.email!)
        .update({'Following': following});
  }

  Future<bool> IsFollowing(String mail) async {
    User? user = FirebaseAuth.instance.currentUser;

    DocumentReference docRef =
        FirebaseFirestore.instance.collection('Users').doc(user!.email);
    DocumentSnapshot doc = await docRef.get();
    List<String> following = List<String>.from(doc['Following'] as List);

    return following.contains(mail);
  }
}
