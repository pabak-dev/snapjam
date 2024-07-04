import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapjam/screens/Design/LandingPage.dart';

class Authentication with ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  late String userId = '-1';
  static String _mail = "example@gmail.com";

  String get getUserId => userId;
  String get getMail => _mail;

  User? get getUser => firebaseAuth.currentUser;

  Future LogIntoAccount(String mail, String pass) async{
    try {
      UserCredential credential = await firebaseAuth.signInWithEmailAndPassword(
          email: mail, password: pass);

      User? user = credential.user;
      userId = user!.uid;
      _mail = mail;
      print(userId);
      notifyListeners();
    }
    on FirebaseAuthException catch (e){
      DisplayMessage(e.code);
    }
  }

  void DisplayMessage(String s){
    Get.showSnackbar(GetSnackBar(
      message: s,
      title: "Error",
      duration: const Duration(seconds: 2),
      isDismissible: true,
    ) );
  }

  Future CreateAccount(String mail, String pass) async{

    try {
      UserCredential credential = await firebaseAuth.createUserWithEmailAndPassword(
          email: mail, password: pass);

      User? user = credential.user;
      userId = user!.uid;
      _mail = mail;
      print(userId);
      notifyListeners();
    }
    on FirebaseAuthException catch (e){
      DisplayMessage(e.code);
    }
  }

  void LogOut(){
    firebaseAuth.signOut();
    Get.offAll(LandingPage());
  }
}
