import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapjam/screens/Controller/Authentication.dart';
import 'package:snapjam/screens/Controller/HomeC.dart';
import 'package:snapjam/screens/Design/AccountPage.dart';
import 'package:snapjam/screens/Design/PostDesign.dart';
import 'package:snapjam/screens/Design/Search.dart';
import '../../constants/ConstantColors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(0),
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('Posts')
                  .orderBy("TimeStamp", descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length + 1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10, top: 10),
                            child: Column(
                              children: [
                                //  if (c.task != null)
                                //  Text(c.getUploadProgress.toString(), style: TextStyle(color: cc.whiteColor),),
                                if (c.pickedFile != null)
                                  Text(
                                    c.getPickedFile!.name,
                                    style: TextStyle(color: cc.whiteColor),
                                  ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    (c.pickedFile == null)
                                        ? IconButton(
                                            onPressed: () async {
                                              await c.SelectFile();
                                              setState(() {});
                                            },
                                            icon: Icon(
                                              Icons.photo_library_rounded,
                                              color: cc.whiteColor,
                                            ))
                                        : IconButton(
                                            onPressed: () {
                                              c.ClearFile();
                                              setState(() {});
                                            },
                                            icon: Icon(
                                              Icons.cancel_rounded,
                                              color: cc.redColor,
                                            )),
                                    Expanded(
                                        child: TextField(
                                      controller: c.postController,
                                      textAlign: TextAlign.left,
                                      decoration: InputDecoration(
                                        labelText: "Share your moment...",
                                        labelStyle:
                                            TextStyle(color: cc.greyColor),
                                        prefixIconColor: cc.greyColor,
                                        fillColor: cc.blueGreyColor,
                                        filled: true,
                                      ),
                                      style: TextStyle(color: cc.whiteColor),
                                    )),
                                    IconButton(
                                        onPressed: () async {
                                          await c.CreatePost();
                                          setState(() {});
                                        },
                                        icon: Icon(
                                          Icons.file_upload_outlined,
                                          color: cc.whiteColor,
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          );
                        } else {
                          final post = snapshot.data!.docs[index - 1];
                          return FutureBuilder<DocumentSnapshot>(
                            future: getName(
                                FirebaseAuth.instance.currentUser!.email!),
                            builder: (BuildContext context,
                                AsyncSnapshot<DocumentSnapshot> snapshot) {
                              if (snapshot.hasError) {
                                return Text("Error: ${snapshot.error}");
                              }

                              if (!snapshot.hasData || !snapshot.data!.exists) {
                                return const Text("Document does not exist");
                              }

                              var userData =
                                  snapshot.data!.data() as Map<String, dynamic>;

                              return (List<String>.from(
                                          userData['Following'] as List)
                                      .contains(post['UserMail']))
                                  ? PostWidget(
                                      user: post['UserMail'],
                                      /*timeStamp: post['TimeStamp'],*/
                                      message: post['Message'],
                                      url: post['FileURL'],
                                      dpUrl: post['DPURL'],
                                      docName: post.id,
                                      likes: List<String>.from(
                                          post['Likes'] as List),
                                    )
                                  : const SizedBox(
                                      height: 0,
                                      width: 0,
                                    );
                            },
                          );
                        }
                      });
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10, top: 10),
                    child: Column(
                      children: [
                        //  if (c.task != null)
                        //  Text(c.getUploadProgress.toString(), style: TextStyle(color: cc.whiteColor),),
                        if (c.pickedFile != null)
                          Text(
                            c.getPickedFile!.name,
                            style: TextStyle(color: cc.whiteColor),
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            (c.pickedFile == null)
                                ? IconButton(
                                    onPressed: () async {
                                      await c.SelectFile();
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      Icons.photo_library_rounded,
                                      color: cc.whiteColor,
                                    ))
                                : IconButton(
                                    onPressed: () {
                                      c.ClearFile();
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      Icons.cancel_rounded,
                                      color: cc.redColor,
                                    )),
                            Expanded(
                                child: TextField(
                              controller: c.postController,
                              textAlign: TextAlign.left,
                              decoration: InputDecoration(
                                labelText: "Share your moment...",
                                labelStyle: TextStyle(color: cc.greyColor),
                                prefixIconColor: cc.greyColor,
                                fillColor: cc.blueGreyColor,
                                filled: true,
                              ),
                              style: TextStyle(color: cc.whiteColor),
                            )),
                            IconButton(
                                onPressed: () async {
                                  await c.CreatePost();
                                  setState(() {});
                                },
                                icon: Icon(
                                  Icons.file_upload_outlined,
                                  color: cc.whiteColor,
                                ))
                          ],
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          )),
          Container(
              decoration: BoxDecoration(color: cc.blueGreyColor),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () => Get.to(const SearchUsersPage()),
                      icon: Icon(
                        Icons.search_rounded,
                        color: cc.whiteColor,
                      )),
                  IconButton(
                      onPressed: () {
                        print("credits");
                      },
                      icon: Icon(
                        Icons.info_rounded,
                        color: cc.whiteColor,
                      ))
                ],
              ))
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        leading: IconButton(
            onPressed: () => Get.to(AccountPage(
                  mail: user!.email!,
                )),
            icon: Icon(
              Icons.account_circle_rounded,
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

  Future<DocumentSnapshot<Object?>> getName(String mail) async {
    return (await FirebaseFirestore.instance
        .collection('Users')
        .doc(mail)
        .get());
  }
}
