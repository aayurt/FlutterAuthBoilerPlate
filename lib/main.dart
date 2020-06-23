import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Dashboard.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
// import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/constants.dart';
import 'Routes/routes.dart' as router;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert' show json, base64, ascii;

final storage = FlutterSecureStorage();
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Future<String> get jwtOrEmpty async {
    var jwt = await storage.read(key: "jwt");
    if (jwt == null) return "";
    return jwt;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      onGenerateRoute: router.generateRoute,
      // initialRoute: 'home',
      home: FutureBuilder(
          future: jwtOrEmpty,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            if (snapshot.data != "") {
              var str = snapshot.data;
              var jwt = str.split(".");
              if (jwt.length != 3) {
                return WelcomeScreen();
              } else {
                var payload = json.decode(
                    ascii.decode(base64.decode(base64.normalize(jwt[1]))));

                if (DateTime.fromMillisecondsSinceEpoch(payload["exp"] * 1000)
                    .isAfter(DateTime.now())) {
                  return Dashboard(str, payload);
                } else {
                  return WelcomeScreen();
                }
              }
            } else {
              return WelcomeScreen();
            }
          }),
      // home: WelcomeScreen(),
    );
  }
}
