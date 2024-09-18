import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapjam/constants/ConstantColors.dart';
import 'package:snapjam/screens/Controller/AccountC.dart';
import 'package:snapjam/screens/Controller/Authentication.dart';
import 'package:snapjam/screens/Design/Home.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key, required this.mail});
  final String mail;



  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    final ConstantColors cc = ConstantColors();
    final auth = Get.put(Authentication());
    final User? user = FirebaseAuth.instance.currentUser;
    final c = Get.put(AccountC());

    return Scaffold(
      backgroundColor: cc.darkColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Users')
              //  .orderBy("TimeStamp", descending: true)
              .doc(widget.mail)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData && !snapshot.hasError) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipOval(
                        child: SizedBox(
                            height: 100,
                            width: 100,
                            child: CachedNetworkImage(
                              imageUrl: (snapshot.data!['ProfileImage'] == 'null') ? 'https://placehold.co/600x400/png' : snapshot.data!['ProfileImage'],
                            )), // Replace with actual image URL
                      ),
                      if (widget.mail == user!.email)
                      IconButton(
                          onPressed: () async {
                            await c.SelectFile();
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.file_upload_outlined,
                            color: cc.whiteColor,
                          ))
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      Text(
                        snapshot.data!['FirstName']
                            + ' '
                            + snapshot.data!['LastName'],
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: cc.whiteColor),
                      ),
                      const Spacer(),
                      if (widget.mail != user.email)
                      IconButton(
                          onPressed: () async {
                            c.FollowToggle(widget.mail);
                            setState(() {});
                          },
                          icon: Icon(
                            List<String>.from(snapshot.data!['Followers'] as List).contains(user.email) ?
                            Icons.star_rounded :
                            Icons.star_border_rounded,
                            color: cc.yellowColor,
                          ))
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  const Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.email_rounded,
                      color: cc.greenColor,
                    ),
                    title: Text(
                      'Email',
                      style: TextStyle(color: cc.blueColor),
                    ),
                    subtitle: Text(
                      snapshot.data!['UserMail'],
                      style: TextStyle(color: cc.whiteColor),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.link,
                      color: cc.greenColor,
                    ),
                    title: Text(
                      'Website',
                      style: TextStyle(color: cc.blueColor),
                    ),
                    subtitle: Text(
                      'https://userwebsite.com',
                      style: TextStyle(color: cc.whiteColor),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.calendar_today_rounded,
                      color: cc.greenColor,
                    ),
                    title: Text(
                      'Joined On',
                      style: TextStyle(color: cc.blueColor),
                    ),
                    subtitle: Text(
                      (snapshot.data!['Created'] as Timestamp)
                          .toDate()
                          .toString()
                          .substring(0, 10),
                      style: TextStyle(color: cc.whiteColor),
                    ),
                  ),
                ],
              );
            } else {
              return const Placeholder();
            }
          },
        ),
      ),
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
