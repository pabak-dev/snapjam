import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapjam/screens/Design/AccountPage.dart';
import '../../constants/ConstantColors.dart';

class SearchUsersPage extends StatefulWidget {
  const SearchUsersPage({super.key});

  @override
  State<SearchUsersPage> createState() => _SearchUsersPageState();
}

class _SearchUsersPageState extends State<SearchUsersPage> {
  final TextEditingController _searchController = TextEditingController();
  List<QueryDocumentSnapshot>? _searchResults = [];

  @override
  Widget build(BuildContext context) {
    final ConstantColors cc = ConstantColors();

    return Scaffold(
      backgroundColor: cc.darkColor,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text("Search Users", style: TextStyle(color: cc.whiteColor)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    style: TextStyle(color: cc.whiteColor),
                    decoration: InputDecoration(
                      hintText: 'Search by first or last name...',
                      hintStyle: TextStyle(color: cc.greyColor),
                      fillColor: cc.blueGreyColor,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search_rounded, color: cc.whiteColor),
                  onPressed: _performSearch,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _searchResults == null
                  ? Center(
                      child: Text("Search for users",
                          style: TextStyle(color: cc.greyColor)))
                  : ListView.builder(
                      itemCount: _searchResults!.length,
                      itemBuilder: (context, index) {
                        final userDoc = _searchResults![index];
                        final firstName = userDoc['FirstName'];
                        final lastName = userDoc['LastName'];
                        final email = userDoc.id;

                        return GestureDetector(
                          onTap: () {
                            Get.to(AccountPage(mail: email));
                          },
                          child: ListTile(
                            title: Text("$firstName $lastName",
                                style: TextStyle(color: cc.whiteColor)),
                            subtitle: Text(email,
                                style: TextStyle(color: cc.greyColor)),
                            tileColor: cc.blueGreyColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _performSearch() async {
    final query = _searchController.text.trim().toLowerCase();

    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
      });
      return;
    }

    _searchResults = [];
    final usersCollection = FirebaseFirestore.instance.collection('Users');
    final res = await usersCollection.get();

    for (QueryDocumentSnapshot<Map<String, dynamic>> doc in res.docs) {
      if (('${doc['FirstName'].toString().toLowerCase()} ${doc['LastName'].toString().toLowerCase()}')
          .contains(query)) {
        _searchResults?.add(doc);
      }
    }
    print(_searchResults);

    setState(() {});
  }
}
