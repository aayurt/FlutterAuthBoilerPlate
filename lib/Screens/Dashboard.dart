import 'package:flutter/material.dart';
import 'package:flutter_auth/Routes/routes.dart' as router;
import 'package:http/http.dart' as http;
import 'dart:convert' show json, base64, ascii;

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
  // Widget build(BuildContext context) => Scaffold(
  //       appBar: AppBar(title: Text("Secret Data Screen")),
  //       body: Center(
  //         child: FutureBuilder(
  //             future: http.read('http://aayushshrestha.com:3001/api/data',
  //                 headers: {"Authorization": jwt}),
  //             builder: (context, snapshot) => snapshot.hasData
  //                 ? Column(
  //                     children: <Widget>[
  //                       Text("${payload['username']}, here's the data:"),
  //                     ],
  //                   )
  //                 : snapshot.hasError
  //                     ? Text("An error occurred")
  //                     : CircularProgressIndicator()),
  //                 //     builder: (context, snapshot) => snapshot.hasData
  //                 // ? Column(
  //                 //     children: <Widget>[
  //                 //       Text("${payload['username']}, here's the data:"),
  //                 //     ],
  //                 //   )
  //                 // : snapshot.hasError
  //                 //     ? Text("An error occurred")
  //                 //     : CircularProgressIndicator()),
  //       ),
  //     );
}
