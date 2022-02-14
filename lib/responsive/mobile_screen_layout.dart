import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/user_provider.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:instagram_clone/models/user.dart' as model;

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}
class _MobileScreenLayoutState extends State<MobileScreenLayout>{
  // String username = "";
  //
  // void initState(){
  //   super.initState();
  //   getUsername();
  // }
  // void getUsername() async{
  //   DocumentSnapshot snap = await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get();
  //
  //   setState(() {
  //     username = (snap.data() as Map<String, dynamic>)['username'];
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    // model.User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      body: Center(child: Text("this is mobile screen")),
      // bottomNavigationBar: CupertinoTabBar(
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: '', backgroundColor: primaryColor)
      //   ],
      // ),
    );
  }
}