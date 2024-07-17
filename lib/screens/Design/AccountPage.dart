import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapjam/constants/ConstantColors.dart';
import 'package:snapjam/screens/Controller/Authentication.dart';
import 'package:snapjam/screens/Controller/HomeC.dart';
import 'package:snapjam/screens/Design/Home.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ConstantColors cc = ConstantColors();
    final auth = Get.put(Authentication());
    final User? user = FirebaseAuth.instance.currentUser;

    final c = Get.put(HomeC());

    return Scaffold(
      backgroundColor: cc.darkColor,
//      body:
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        leading: IconButton(
            onPressed: () => Get.to(const Home()),
            icon: Icon(
              Icons.arrow_back_rounded,
              color: cc.whiteColor,
            )),
        title: Column(children: [
          Center(
            child: cc.IconSJ(),
          ),
          Center(
              child: Text(user!.email!,
                  style: TextStyle(
                      color: cc.whiteColor,
                      fontSize: 14,
                      fontStyle: FontStyle.italic))),
        ]),
        centerTitle: true,
        toolbarHeight: 70,
        actions: [
          IconButton(
              onPressed: () => auth.LogOut(),
              icon: Icon(
                Icons.logout_rounded,
                color: cc.redColor,
              ))
        ],
      ),
    );
  }
}
