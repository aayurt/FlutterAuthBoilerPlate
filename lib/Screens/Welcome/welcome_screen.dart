import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Welcome/components/body.dart';

class WelcomeScreen extends StatelessWidget {
  final String argument;
  const WelcomeScreen({Key key, this.argument}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
