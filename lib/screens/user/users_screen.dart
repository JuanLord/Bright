import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bright_app/authentication/auth.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("My User Account",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
            const SizedBox(height: 20,),
            Text(user?.email ?? 'No User Email'),
            //const Text(),
            ElevatedButton(
                onPressed: signOut,
                child: const Text("Sign out"),
            ),
          ],
        ),
      ),
    );
  }
}
