import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

final storage = FlutterSecureStorage();

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async {
        Fluttertoast.showToast(
          msg: 'QUIT',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
        );

        return false;
      },
      child: Scaffold(
        appBar: AppBar(title: Text("WELCOME")),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('Logout'),
                onTap: () async {
                  await storage.delete(key: "jwt");
                  // await storage.write(key: "jwt", value: null);
                  Navigator.pushNamed(context, 'login',
                      arguments: "I am Passed from Login");

                  // Add your onPressed code here!
                },
                // Update the state of the app.
                // ...
              ),
            ],
          ), // Populate the Drawer in the next step.
        ),
        body: Center(child: Text("I am at Home")),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () async {
        //     await storage.delete(key: "jwt");
        //     // await storage.write(key: "jwt", value: null);
        //     Navigator.pushNamed(context, 'login',
        //         arguments: "I am Passed from Login");

        //     // Add your onPressed code here!
        //   },
        //   child: Icon(Icons.navigation),
        //   backgroundColor: Colors.green,
        // ),
      ),
    );
  }
}
