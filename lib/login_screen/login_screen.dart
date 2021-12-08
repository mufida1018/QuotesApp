//@dart=2.9
import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutterquotes1/home_screen/main_screen.dart';
import 'package:flutterquotes1/quotes.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // @override
  // void initState() {
  //   var user =  FirebaseAuth.instance.currentUser;
  //
  //    if(user != null){
  //       Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (_) => HomeScreen()), (route) => false);
  //     }
  //
  //   super.initState();
  // }
  @override
  void initState() {
       addQuotesToFirebase();
    super.initState();
  }

  final formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("Images/register.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: Text("Hey!", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.white),)),
                Text("Final step before we move ahead",
                  style: TextStyle(fontSize: 20, color: Colors.white70),),
                Text("Let's create an account for you",
                  style: TextStyle(fontSize: 20, color: Colors.white70),),
              ],
            ),
            SafeArea(
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            prefixIcon: Icon(Icons.email, color: Colors.white,),
                            suffixIcon: emailController.text.isEmpty
                                ? Container(width: 0,)
                                :
                            IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () {
                                emailController.clear();
                              },),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          autofillHints: [AutofillHints.email],
                          validator: (email) =>
                          email != null && !EmailValidator.validate(email)
                              ? 'Emter a valid email'
                              : null,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          obscureText: obscureText,
                          obscuringCharacter: '*',
                          controller: passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            prefixIcon: Icon(Icons.lock, color: Colors.white,),
                            suffixIcon: passwordController.text.isEmpty
                                ? Container(width: 0,)
                                :
                            GestureDetector(
                              child: Icon(Icons.remove_red_eye_outlined),
                              onLongPress: () {
                                setState(() {
                                  obscureText = false;
                                });
                              },
                              onLongPressUp: () {
                                setState(() {
                                  obscureText = true;
                                });
                              },
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        child: Container(
                          height: 60,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Center(child: Text("Login", style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),)),
                        ),
                        onTap: () {
                          //firebaselogin
                          loginUser();
                        },
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text("OR", style: TextStyle(fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),),
                      SizedBox(
                        height: 20,
                      ),

                      SignInButton(
                         Buttons.Google,
                          onPressed: () {
                           signInWithGoogle();

                         }
                         ),

                      SignInButton(
                          Buttons.AppleDark,
                          onPressed: (){
                            //AppleSignIn
                          }),

                    ],
                  ),
                )),

          ],
        ),
      ),
    );
  }

  void loginUser() {
    if (passwordController.text == "") {
      Fluttertoast.showToast(
          msg: 'Password cannot be blank', backgroundColor: Colors.red);
    } else {
      String email = emailController.text;
      String password = passwordController.text;
      FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password).then((value) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
      }).catchError((e) {
        Fluttertoast.showToast(msg: '$e', backgroundColor: Colors.red);
      });
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    var user = await FirebaseAuth.instance.currentUser;
    final authService = AuthService();
    final googleSignin = GoogleSignIn(scopes: ['email']);
    final GoogleSignInAccount googleuser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth = await googleuser.authentication;

    final
    GoogleAuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken
    );
    Fluttertoast.showToast(msg: "Logged In");
    // final result = await authService.signInWithCredential(credential);
    FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (_) =>  HomeScreen()));
    });
    // print('${googleuser.displayName}');
    // print('${googleuser.email}');
    // print('${googleuser.id}');
    // checkIfUserIsNew();
    // addgoogleUsersData(user.uid , user.displayName , user.email);

  }



  void addgoogleUsersData(String uid , name , email) async{
    var user = await FirebaseAuth.instance.currentUser;
    // final googlUserData = signInWithGoogle();
    Map<String, dynamic> usersData ={
      'name': name,
      'email': email,
      'uid' : uid,
    };
    FirebaseFirestore.instance.collection('users').doc(uid).set(usersData).then((value){
      Fluttertoast.showToast(msg: 'Welcome to the App' ,backgroundColor: Colors.green);
      if(user != null){
             Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (_) => HomeScreen()), (route) => false);
      }
    }).catchError((e){
      Fluttertoast.showToast(msg: '$e',backgroundColor: Colors.green);
    });
  }



  void checkIfUserIsNew() async{
    var timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    var user = await FirebaseAuth.instance.currentUser;
    var uid = user.uid;
    FirebaseFirestore.instance.collection('users').where('email',isEqualTo : user.email).get().then((datasnapshot){
      if(datasnapshot.docs.length ==  0){
        var userData = {
          'name': user.displayName,
          'email':user.email,
          'uid': uid,
          'timestamp' : timestamp,
        };
        FirebaseFirestore.instance.collection('users').doc(uid).set(userData).then((value) {
         print('added');
        }).catchError((e) {
          Fluttertoast.showToast(msg: '$e', backgroundColor: Colors.green);
        });
      }else{

      }
    });

  }



  }

class AuthService {
  final _auth = FirebaseAuth.instance;

  Future<UserCredential> signInWithCredential(AuthCredential credential) =>
      _auth.signInWithCredential(credential);
  Future<void> logout() => _auth.signOut();
  Stream<User> get currentUser => _auth.authStateChanges();
}

