import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapjam/screens/Controller/Authentication.dart';
import '../../constants/ConstantColors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final ConstantColors cc = ConstantColors();
    final auth = Get.put(Authentication());

    return Scaffold(
      backgroundColor: cc.darkColor,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: cc.IconSJ(),
        ),
        Center(child: Text(auth.getUser!.email!, style: TextStyle(color: cc.whiteColor, fontSize: 18)))
      ]),
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text("SnapJam", style: TextStyle(color: cc.whiteColor),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () => auth.LogOut(), icon: Icon(Icons.logout_rounded, color: cc.redColor,))
        ],
      ),
    );
  }
}
