import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapjam/screens/Controller/Authentication.dart';
import 'package:snapjam/screens/Controller/HomeC.dart';
import 'package:snapjam/screens/Design/PostDesign.dart';
import '../../constants/ConstantColors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final ConstantColors cc = ConstantColors();
    final auth = Get.put(Authentication());
    final User? user = FirebaseAuth.instance.currentUser;

    final c = Get.put(HomeC());

    return Scaffold(
      backgroundColor: cc.darkColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Posts')
                    .orderBy("TimeStamp", descending: false)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final post = snapshot.data!.docs[index];
                          return PostWidget(
                              user: post['UserMail'],
                              /*timeStamp: post['TimeStamp'],*/
                              message: post['Message']);
                        });
                  } else {
                    return Center(
                      child: Text(
                        "An unexpected error occurred!",
                        style: TextStyle(color: cc.whiteColor),
                      ),
                    );
                  }
                },
              ),
            )
          ]),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () => print("Photos"),
                    icon: Icon(
                      Icons.photo_library_rounded,
                      color: cc.greenColor,
                    )),
                Expanded(
                    child: TextField(
                  controller: c.postController,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    labelText: "Share your moment...",
                    labelStyle: TextStyle(color: cc.greyColor),
                    //   prefixIcon: const Icon(Icons.post_add_rounded),
                    prefixIconColor: cc.greyColor,
                    fillColor: cc.blueGreyColor,
                    filled: true,
                  ),
                  style: TextStyle(color: cc.whiteColor),
                )),
                IconButton(
                    onPressed: () => c.CreatePost(),
                    icon: Icon(
                      Icons.send_rounded,
                      color: cc.whiteColor,
                    ))
              ],
            ),
          )
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        leading: IconButton(
            onPressed: () => auth.LogOut(),
            icon: Icon(
              Icons.account_circle_rounded,
              color: cc.whiteColor,
            )),
        title: Column(
            children: [
              Center(
                child: cc.IconSJ(),
              ),
              Center(
                  child: Text(user!.email!,
                      style: TextStyle(color: cc.whiteColor, fontSize: 14, fontStyle: FontStyle.italic))),
            ]),
        centerTitle: true,
        toolbarHeight: 80,
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
