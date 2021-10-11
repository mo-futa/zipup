import 'package:flutter/material.dart';
import 'package:local_print/screens/profile_screen.dart';
import 'package:local_print/providers/user_provider.dart';
import 'package:provider/provider.dart';

import 'screens/login_screen.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (Provider.of<UserProvider>(context, listen: false).user == null) {
          Navigator.of(context).pushNamed(LoginScreen.route);
        } else {
          Navigator.of(context).pushNamed(ProfileScreen.route);
        }
      },
      icon: Icon(
        Icons.person,
        color: Colors.black,
      ),
    );
  }
}
