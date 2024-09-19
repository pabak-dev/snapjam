import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapjam/screens/Design/AccountPage.dart';
import '../../constants/ConstantColors.dart';
class Comment extends StatelessWidget {
  final String text;
  final String user;
  final String time;
  final String id;
  final String cid;
  final ConstantColors cc = ConstantColors();

  User? userFirebase = FirebaseAuth.instance.currentUser;

  Comment({super.key,
    required this.text,
    required this.user,
    required this.time,
    required this.id,
    required this.cid,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: cc.altColor, borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(top: 10, left: 20, right: 40),
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Get.to(AccountPage(mail: user));
                },
                icon: const Icon(
                  Icons.circle_rounded,
                  size: 32,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    child: Text(
                      user,
                      style: TextStyle(color: cc.lightBlueColor),
                    ),
                    onTap: (){
                      Get.to(AccountPage(mail: user));
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    text,
                    style: TextStyle(color: cc.whiteColor, fontSize: 16),
                  ),
                ],
              ),
              const Spacer(),
              if (userFirebase!.email == user)
                IconButton(
                  icon: const Icon(
                    Icons.delete_rounded,
                    size: 28,
                  ),
                  color: cc.greyColor,
                  onPressed: () async {
                    await FirebaseFirestore.instance.collection('Posts').doc(id).collection('Comments').doc('cid').delete();
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }
}
