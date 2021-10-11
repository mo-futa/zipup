import 'package:flutter/material.dart';
import 'package:local_print/main.dart';
import 'package:local_print/screens/orders_screen.dart';
import 'package:local_print/providers/user_provider.dart';
import 'package:local_print/screens/universal_screen.dart';
import 'package:provider/provider.dart';

import '../screens/login_screen.dart';
import '../screens/profile_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: firstColor,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 70,
            ),
            SizedBox(
              height: 100,
            ),
            TextButton(
              onPressed: () {
                if (Provider.of<UserProvider>(context, listen: false).user ==
                    null) {
                  Navigator.of(context).pushNamed(LoginScreen.route);
                } else {
                  Navigator.of(context).pushNamed(ProfileScreen.route);
                }
              },
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Profile screen',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            TextButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(OrdersScreen.route),
              child: Row(
                children: [
                  Icon(
                    Icons.shop_2,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Orders screen',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Navigator.of(context).pop();
                Navigator.of(context).popAndPushNamed(UniversalScreen.route);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Universal screen',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
