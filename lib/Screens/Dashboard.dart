import 'package:flutter/material.dart';
import 'dart:convert' show json, base64, ascii;
import 'package:flutter_auth/Routes/routes.dart' as router;

class Dashboard extends StatelessWidget {
  Dashboard(this.jwt, this.payload);

  factory Dashboard.fromBase64(String jwt) => Dashboard(
      jwt,
      json.decode(
          ascii.decode(base64.decode(base64.normalize(jwt.split(".")[1])))));

  final String jwt;
  final Map<String, dynamic> payload;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: router.generateRoute,
      initialRoute: 'home',
    );
  }
}
