import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storage = FlutterSecureStorage();

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
              image: new DecorationImage(
                image: new AssetImage('assets/images/cmdp.png'),
                // repeat: ImageRepeat.repeat,
              ),
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, "home");
              // Navigator.pushReplacementNamed(context, "home");
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text('About'),
            onTap: () {
              // Navigator.pushReplacementNamed(context, "about");
              Navigator.pushNamed(context, "about");
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text('Contact'),
            leading: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 20,
                minHeight: 20,
                maxWidth: 30,
                maxHeight: 30,
              ),
              child: Image.asset('assets/images/cmdp.png', fit: BoxFit.cover),
            ),
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
      ),
    );
  }
}
