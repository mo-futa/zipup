import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:local_print/providers/user_provider.dart';
import 'package:local_print/screens/universal_screen.dart';
import 'package:provider/provider.dart';

import '../screens/loading_screen.dart';


class LoginRoot extends StatefulWidget {
  @override
  _LoginRootState createState() => _LoginRootState();
}

class _LoginRootState extends State<LoginRoot> {
  //by this point, internet connection is secured so i will initaite firebase
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (_, value) {
          if (value.connectionState == ConnectionState.waiting) {
            return LoadingScreen();
          } else {
            if (value.data == null) {
              Provider.of<UserProvider>(context,listen: false).setUser(value.data);
              print('not logged in');
            } else {
              Provider.of<UserProvider>(context,listen: false).setUser(value.data);
              print('logged in  ${value.data!.uid}');
            }
            print('ffff${Provider.of<UserProvider>(context).user}');
            return UniversalScreen();
          }
        });
  }
}
