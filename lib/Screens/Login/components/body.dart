import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/main.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

final storage = FlutterSecureStorage();

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Future<String> attemptLogIn(String username, String password) async {
      print("AAA");
      var uri = Uri.parse(base_url + '/users/login');
      print("base_url " + base_url);

      print("aa " + uri.host);
      print(uri.port);
      var res = await http.Client().post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
            <String, String>{'username': username, "password": password}),
      );
      debugPrint(res.body);
      final convertDataToJson = json.decode(res.body);
      final data = convertDataToJson['response'];
      debugPrint(data);

      if (data == "success") {
        var jwt = convertDataToJson['token'];
        if (jwt != null) {
          //key is writen here and read in main
          //if main have already JWT key goes to dashboard screen
          storage.write(key: "jwt", value: jwt);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MyApp()),
          );
        }
      }
      return null;
    }

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              controller: _emailController,
            ),
            RoundedPasswordField(
              controller: _passwordController,
              // password = value;
            ),
            RoundedButton(
                text: "LOGIN",
                press: () async {
                  var email = _emailController.text;
                  var password = _passwordController.text;
                  await attemptLogIn(email, password);
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => HomePage.fromBase64(jwt)));
                }),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
