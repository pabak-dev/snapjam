import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapjam/constants/ConstantColors.dart';
import 'package:snapjam/screens/Controller/Comment.dart';
import 'package:snapjam/screens/Design/AccountPage.dart';

import '../Controller/HomeC.dart';

class PostWidget extends StatefulWidget {
  final String user;
  // final String timeStamp;
  final String message;
  final String? url;

  final docName;
  final List<String> likes;

  final TextEditingController commentTextController = TextEditingController();

  final String? dpUrl;

  PostWidget(
      {super.key,
      required this.user,
      // required this.timeStamp,
      required this.message,
      this.url,
      required this.dpUrl,
      required this.docName,
      required this.likes});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  final ConstantColors cc = ConstantColors();

  final HomeC c = Get.put(HomeC());

  bool commentsOpened = true;

  User? userFirebase = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: cc.blueGreyColor, borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(AccountPage(mail: widget.user));
                    },
                    child: CachedNetworkImage(
                      imageUrl: widget.dpUrl!,
                      imageBuilder: (context, imageProvider) => Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        size: 32,
                        color: Colors.red,
                      ),
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
                        child: FutureBuilder<DocumentSnapshot>(
                          future: getName(widget.user),
                          builder: (BuildContext context,
                              AsyncSnapshot<DocumentSnapshot> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {}

                            if (snapshot.hasError) {
                              return Text("Error: ${snapshot.error}");
                            }

                            if (!snapshot.hasData || !snapshot.data!.exists) {
                              return const Text("Document does not exist");
                            }

                            var userData =
                                snapshot.data!.data() as Map<String, dynamic>;

                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  userData['FirstName'] +
                                      ' ' +
                                      userData['LastName'],
                                  style: TextStyle(color: cc.lightBlueColor),
                                ),
                              ],
                            );
                          },
                        ),
                        onTap: () {
                          Get.to(AccountPage(mail: widget.user));
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.message,
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
                            color: (c.getLikeStatus(widget.likes))
                                ? cc.purpleColor
                                : cc.greyColor,
                            onPressed: () {
                              c.HandleLike(widget.docName);
                              setState(() {});
                            },
                          ),
                          Text(
                            widget.likes.length.toString(),
                            style: TextStyle(color: cc.whiteColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: (widget.url != null && widget.url != 'null') ? 10 : 30,
              ),
              if (widget.url != null && widget.url != 'null')
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: widget.url!,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      commentsOpened
                          ? Icons.comments_disabled_rounded
                          : Icons.comment_rounded,
                      size: 28,
                    ),
                    color: commentsOpened ? cc.greenColor : cc.greyColor,
                    onPressed: () {
                      commentsOpened = !commentsOpened;
                      setState(() {});
                    },
                  ),
                  if (userFirebase!.email == widget.user)
                    IconButton(
                      icon: const Icon(
                        Icons.delete_rounded,
                        size: 28,
                      ),
                      color: cc.greyColor,
                      onPressed: () {
                        c.deletePost(widget.docName);
                      },
                    ),
                ],
              ),
            ],
          ),
        ),
        if (commentsOpened)
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 5, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                        child: TextField(
                      controller: widget.commentTextController,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        labelText: "Leave a comment",
                        labelStyle: const TextStyle(color: Colors.grey),
                        prefixIconColor: cc.greyColor,
                        fillColor: cc.altColor,
                        filled: true,
                      ),
                      style: TextStyle(color: cc.whiteColor),
                    )),
                    IconButton(
                        onPressed: () async {
                          await c.CreateComment(
                              widget.commentTextController, widget.docName);
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.add_comment_rounded,
                          color: cc.whiteColor,
                        ))
                  ],
                ),
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Posts')
                    .doc(widget.docName)
                    .collection('Comments')
                    .orderBy("TimeStamp", descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final comment = snapshot.data!.docs[index];
                          return Comment(
                            user: comment['UserMail'],
                            time: comment['TimeStamp'].toString(),
                            text: comment['Message'],
                            id: widget.docName,
                            cid: snapshot.data!.docs[index].id
                          );
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
            ],
          ),
      ],
    );
  }

  Future<DocumentSnapshot<Object?>> getName(String mail) async {
    return (await FirebaseFirestore.instance
        .collection('Users')
        .doc(mail)
        .get());
  }
}
