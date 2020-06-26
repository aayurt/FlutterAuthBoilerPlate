import 'package:flutter_auth/Screens/About/about.dart';
import 'package:flutter_auth/Screens/Animate/animate.dart';
import 'package:flutter_auth/Screens/Dashboard.dart';
import 'package:flutter_auth/Screens/Home/home.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_auth/Screens/noScreen.dart';
// import 'package:flutter_auth/Screens/undefinedView.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      var argument = settings.arguments;
      return MaterialPageRoute(
        builder: (
          context,
        ) =>
            WelcomeScreen(argument: argument),
      );

      break;
    case 'login':
      var argument = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => LoginScreen(argument: argument));
      break;
    case 'register':
      var argument = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => SignUpScreen(argument: argument));
      break;
    case 'home':
      // var argument = settings.arguments;
      return MaterialPageRoute(builder: (context) => Home());
      break;
    case 'about':
      // var argument = settings.arguments;
      return MaterialPageRoute(builder: (context) => About());
      break;
    case 'animate':
      // var argument = settings.arguments;
      return MaterialPageRoute(builder: (context) => NewAnimate());
      break;
    default:
      return MaterialPageRoute(builder: (context) => NoScreen());
      break;
  }
}
