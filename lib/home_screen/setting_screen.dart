
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterquotes1/login_screen/auth_bloc.dart';
import 'package:flutterquotes1/login_screen/welcome_page.dart';


class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

 // late StreamSubscription<User> loginStateSubscription ;


  // @override
  // void initState() {
  //   var authBloc = Provider.of<AuthBloc>(context, listen: false);
  //  loginStateSubscription =  authBloc.currentUser.listen((fbUser) {
  //     if(fbUser == null){
  //       Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (_) => welcomePage()), (route) => false);
  //     }
  //   });
  //   super.initState();
  // }
  //
  // @override
  // void dispose() {
  //   loginStateSubscription.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("Images/homescreen.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("Settings Screen"),
        ),
        body: Container(
          child: Center(
            child: ElevatedButton(
              child: Text("Logout"),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                var user = FirebaseAuth.instance.currentUser;
               if(user == null){
               Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (_) => welcomePage()), (route) => false);
                }

                // authBloc.logout();
              },
            ),
          ),
        ),
      ),
    );
  }
}
