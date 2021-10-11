import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:local_print/screens/universal_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String route = 'login-screen.dart';
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterLogin(
        onSignup: (value) async {
          try {
            final res = await _firebaseAuth.createUserWithEmailAndPassword(
                email: value.name, password: value.password);
            print(res.user);
          } catch (e) {
            return e.toString();
          }
        },
        onLogin: (value) async {
          try {
            await _firebaseAuth.signInWithEmailAndPassword(
                email: value.name, password: value.password);
            print('signed in');
            // Navigator.of(context).pop();
          } catch (e) {
            return e.toString();
          }
        },
        onSubmitAnimationCompleted: () {
          Navigator.of(context).popAndPushNamed(UniversalScreen.route);
        },
        onRecoverPassword: (value) {},
        hideForgotPasswordButton: true,
        title: 'money',
        // userType: LoginUserType.phone,
      ),
    );
  }
}
