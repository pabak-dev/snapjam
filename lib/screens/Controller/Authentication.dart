import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authentication with ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  late String userId;
   String _mail = "dev.pabak@gmail.com";
  String get getUserId => userId;

  String get getMail => _mail;

  Future LogIntoAccount(String mail, String pass) async{
    UserCredential credential = await firebaseAuth.signInWithEmailAndPassword(email: mail, password: pass);

    User? user = credential.user;
    userId = user!.uid;
    _mail = mail;
    print(userId);
    notifyListeners();
  }

  Future CreateAccount(String mail, String pass) async{
    UserCredential credential = await firebaseAuth.createUserWithEmailAndPassword(email: mail, password: pass);

    User? user = credential.user;
    userId = user!.uid;
    _mail = mail;
    print(userId);
    notifyListeners();
  }

  Future LogOut(){
    return firebaseAuth.signOut();
  }
}
