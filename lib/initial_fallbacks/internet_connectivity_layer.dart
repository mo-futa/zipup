
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:local_print/main.dart';

import '../screens/loading_screen.dart';

import 'login_layer.dart';

class InternetConnectionRoot extends StatelessWidget {
  const InternetConnectionRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Connectivity().onConnectivityChanged,
        builder: (_, value) {
          if (value.connectionState != ConnectionState.active) {
            return LoadingScreen();
          } else {
            if (value.data != ConnectivityResult.none) {
              // Navigator.of(context).pushNamed('LoginRoot');
              return LoginRoot();
            }
            return NoConnectionScreen();
          }
        });
  }
}
class NoConnectionScreen extends StatelessWidget {
  const NoConnectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Material(
      child: Container(
        color: firstColor,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'No connection',
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
              SizedBox(height: 20),
              Icon(Icons.connect_without_contact)
            ],
          ),
        ),
      ),
    ));
  }
}
