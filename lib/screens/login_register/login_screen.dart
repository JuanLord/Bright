import 'dart:ui';

import 'package:bright_app/authentication/auth.dart';
import 'package:bright_app/screens/dashboaerd_screen.dart';
import 'package:bright_app/screens/home/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text
      );
      print("Login");
      Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen()),);
    } on FirebaseAuthException catch (e) {
      setState(() {
        print("EEAAEE");
        errorMessage = e.message;
      });
    }
  }
  Future<void> createUserWithEmailAndPassword() async {
    try {
      print("Register 1");
      await Auth().createUserWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text,
      );
      print("2");
      await sendUserData();
    } on FirebaseAuthException catch (e) {
      setState(() {
        print("Error 3 $e");
        errorMessage = e.message;
      });
    }
  }
  Future<String> _getUserID() async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    User user = auth.currentUser!;
    return user.uid;
  }
  Future<void> sendUserData() async {
    print("IN");
    CollectionReference users = FirebaseFirestore.instance.collection('usersData');
    String userID = await _getUserID();
    print(userID);
    users.doc(userID).set({
      'name': _controllerName.text,
      'email': _controllerEmail.text,
    });
  }

  Widget _errorMessage() {
    return Center(child: Text(errorMessage == '' ? '' : 'Humm ? $errorMessage', style: TextStyle(color: Colors.red),));
  }
  Widget _submitButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[500]),
      onPressed: isLogin
          ?
        signInWithEmailAndPassword
        //Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreenView()),);

          : createUserWithEmailAndPassword,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.blue[500]
        ),
        child: Center(
          child: Text(isLogin ? "Login" : "Register", style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.bold ),),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.blue[300]!,
              Colors.blue[500]!,
              Colors.blue[800]!,
            ]
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80,),
            Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(isLogin ? "Login" : "Register", style: TextStyle(color: Colors.white,fontSize: 40),),
                    SizedBox(height: 10,),
                    Text("Welcome Back", style: TextStyle(color: Colors.white, fontSize: 18),),
                  ],
                ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(60),topLeft: Radius.circular(60)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [BoxShadow(
                            color: Color.fromRGBO(30, 95, 255, .3),
                            blurRadius: 20,
                            offset: Offset(0,10),
                          )]
                        ),
                        child: Column(
                          children: <Widget>[
                            !isLogin ? Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
                              ),
                              child: TextField(
                                controller: _controllerName,
                                decoration: InputDecoration(
                                  hintText: "Name",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                ),
                              ),
                            ) :  Container(),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
                              ),
                              child: TextField(
                                controller: _controllerEmail,
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
                              ),
                              child: TextField(
                                obscureText: true,
                                controller: _controllerPassword,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40,),
                      TextButton(child: Text(isLogin ? "New to Bright? Register!" : "Already on Bright? Log In!",style: TextStyle(color: Colors.grey, decoration: TextDecoration.underline, fontSize: 16),), onPressed: () {setState(() {isLogin = !isLogin;});},),
                      _errorMessage(),
                      SizedBox(height: 40,),
                      _submitButton(),
                      SizedBox(height: 80,),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
