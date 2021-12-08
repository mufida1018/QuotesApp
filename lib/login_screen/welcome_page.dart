
import 'package:flutter/material.dart';
import 'package:flutterquotes1/login_screen/login_screen.dart';
import 'package:flutterquotes1/login_screen/registration_screen.dart';
import 'package:lottie/lottie.dart';

class welcomePage extends StatefulWidget {
  @override
  _welcomePageState createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {
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
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("Welcome to ",style: TextStyle(fontSize: 29,fontWeight: FontWeight.bold),),
                    Text("Quotes App" , style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.lightBlue),),
                  ],
                ),
              ),
              Text("Grate Quotes can be inspirational",style: TextStyle(fontSize: 18,color: Colors.white),),
              Text("and motivational.",style: TextStyle(fontSize: 18,color: Colors.white)),
              Center(
                child: Lottie.asset("lottie/yoga.json",),
              ),
              InkWell(
                child: Container(
                  height:50,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(child: Text("Get Started!",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.blue),)),

                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Text("Don't have an account?",style: TextStyle(fontSize: 18),),
                    InkWell(
                        child: Text("Create one",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                      onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_) => RegistrationScreen()));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),

        ),

      ),
    );
  }
}
