import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapjam/constants/ConstantColors.dart';

import '../Controller/HomeC.dart';

class PostWidget extends StatelessWidget {
  final String user;
  // final String timeStamp;
  final String message;
  final String? url;

  final ConstantColors cc = ConstantColors();
  final HomeC c = Get.put(HomeC());
  final docName;
  final List<String> likes;

  User? userFirebase = FirebaseAuth.instance.currentUser;

  PostWidget(
      {super.key,
      required this.user,
      // required this.timeStamp,
      required this.message,
      this.url,
      required this.docName, required this.likes});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: cc.blueGreyColor, borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.circle_rounded,
                size: 32,
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
                  Text(
                    user,
                    style: TextStyle(color: cc.lightBlueColor),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    message,
                    style: TextStyle(color: cc.whiteColor, fontSize: 16),
                  ),
                ],
              ),
              //    SizedBox(width: 80,),
              const Spacer(),
              Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.thumb_up_alt_rounded,
                          size: 28,
                        ),
                        color: (c.getLikeStatus(likes)) ? cc.greenColor : cc.greyColor,
                        onPressed: (){
                          c.HandleLike(docName);
                        },
                      ),
                      Text(likes.length.toString(), style: TextStyle(color: cc.whiteColor),),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.comment_rounded,
                          size: 28,
                        ),
                        color: cc.greyColor,
                        onPressed: () {},
                      ),
                      Text('0', style: TextStyle(color: cc.whiteColor),),
                    ],
                  ),
                ],
              ),
            ],
          ),
          if (url != null && url != 'null')
            const SizedBox(
              height: 10,
            ),
          if (url != null && url != 'null')
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                url!,
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (userFirebase!.email == user)
                IconButton(
                  icon: const Icon(
                    Icons.delete_rounded,
                    size: 28,
                  ),
                  color: cc.greyColor,
                  onPressed: () {c.deletePost(docName);},
                ),
            ],
          ),
        ],
      ),
    );
  }
}
