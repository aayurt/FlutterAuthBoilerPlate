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
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                  context, "home", ModalRoute.withName('home'));
            },
          ),
          ListTile(
            title: Text('About'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "about");
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
            onTap: () {},
          ),
          ListTile(
            title: Text('Animate'),
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
              Navigator.pop(context);
              Navigator.pushNamed(context, "animate");
            },
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () async {
              Navigator.pop(context);
              await storage.delete(key: "jwt");
              Navigator.pushNamedAndRemoveUntil(
                  context, "login", ModalRoute.withName('login'));
            },
          ),
        ],
      ),
    );
  }
}
