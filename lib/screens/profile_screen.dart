import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:local_print/screens/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  static const String route = 'profile';
  // const ProfileScreen({Key? key}) : super(key: key);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('profile'),
      ),
      body: Center(
        child: TextButton(
          child: Text('Log out'),
          onPressed: () async {
            try {
              await _firebaseAuth.signOut();
              Navigator.of(context).popAndPushNamed(LoginScreen.route);
            } catch (e) {
              print(e.toString());
            }
          },
        ),
      ),
    );
  }
}
