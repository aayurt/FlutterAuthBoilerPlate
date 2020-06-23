import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Signup/components/body.dart';

class SignUpScreen extends StatelessWidget {
  final String argument;
  const SignUpScreen({Key key, this.argument}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
