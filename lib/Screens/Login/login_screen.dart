import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/body.dart';

class LoginScreen extends StatelessWidget {
  final String argument;
  const LoginScreen({Key key, this.argument}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
