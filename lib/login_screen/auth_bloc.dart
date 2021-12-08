// //@dart=2.9
//
//
// //import 'dart:js';
//
//
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutterquotes1/home_screen/main_screen.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
//
// class AuthBloc {
//   final authService = AuthService();
//   final googleSignin = GoogleSignIn(scopes: ['email']);
//
//   Stream<User> get currentUser => authService.currentUser;
//
//   loginGoogle() async {
//
//     try {
//       final GoogleSignInAccount googleUser = await googleSignin.signIn();
//       final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//       final AuthCredential credential = GoogleAuthProvider.credential(
//           idToken: googleAuth.idToken,
//           accessToken: googleAuth.accessToken
//       );
//
//       //Firebase Sign in
//       final result = await authService.signInWithCredential(credential);
//
//       // print('${result.user.displayName}');
//       // print('${result.user.email}');
//       // print('${result.user.uid}');
//       checkIfUserIsNew();
//       addgoogleUsersData(result.user.displayName , result.user.email, result.user.uid );
//
//
//
//     } catch(error){
//       print(error);
//     }
//
//
//   }
//
//   logout() {
//     authService.logout();
//     print("Logout");
//   }
//
// }
//
// class AuthService {
//   final _auth = FirebaseAuth.instance;
//
//   Future<UserCredential> signInWithCredential(AuthCredential credential) =>
//       _auth.signInWithCredential(credential);
//   Future<void> logout() => _auth.signOut();
//   Stream<User> get currentUser => _auth.authStateChanges();
// }
//
//
//
//
// void addgoogleUsersData(String uid , name , email){
//   final googlUserData = AuthBloc();
//   Map<String, dynamic> usersData ={
//     'name': name,
//     'email': email,
//     'uid' : uid,
//   };
//   FirebaseFirestore.instance.collection('users').doc(uid).set(usersData).then((value){
//     Fluttertoast.showToast(msg: 'Welcome to the App' ,backgroundColor: Colors.green);
//   }).catchError((e){
//     Fluttertoast.showToast(msg: '$e',backgroundColor: Colors.green);
//   });
// }
//
//
//    void checkIfUserIsNew() async{
//   var timestamp = DateTime.now().millisecondsSinceEpoch.toString();
//   var user = await FirebaseAuth.instance.currentUser;
//   var uid = user.uid;
//   FirebaseFirestore.instance.collection('users').where('email',isEqualTo : user.email).get().then((datasnapshot){
//   if(datasnapshot.docs.length ==  0){
//     var userData = {
//       'name': user.displayName,
//       'email':user.email,
//       'uid': uid,
//        'timestamp' : timestamp,
//      };
//     FirebaseFirestore.instance.collection('users').doc(uid).set(userData).then((value) {
//
//   }).catchError((e) {
//       Fluttertoast.showToast(msg: '$e', backgroundColor: Colors.green);
//   });
//   }else{
//
//   }
//   });
//
// }