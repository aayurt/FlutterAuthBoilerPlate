import 'package:flutter/material.dart';
import 'package:flutter_auth/Drawer/drawer.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

final storage = FlutterSecureStorage();
// return new WillPopScope(
//       onWillPop: () async {
//         Fluttertoast.showToast(
//           msg: 'QUIT',
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           timeInSecForIosWeb: 1,
//         );

//         return false;
//       },
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("WELCOME")),
      drawer: AppDrawer(),
      //  Drawer(
      //   child: ListView(
      //     // Important: Remove any padding from the ListView.
      //     padding: EdgeInsets.zero,
      //     children: <Widget>[
      //       DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Colors.blue,
      //           image: new DecorationImage(
      //             image: new AssetImage('assets/images/cmdp.png'),
      //             // repeat: ImageRepeat.repeat,
      //           ),
      //         ),
      //         child: Text('Drawer Header'),
      //       ),
      //       ListTile(
      //         title: Text('Home'),
      //         onTap: () {
      //           // Update the state of the app.
      //           // ...
      //         },
      //       ),
      //       ListTile(
      //         title: Text('About'),
      //         onTap: () {
      //           Navigator.pushReplacementNamed(context, "about");
      //           // Navigator.pushNamed(context, "about");
      //           // Update the state of the app.
      //           // ...
      //         },
      //       ),
      //       ListTile(
      //         title: Text('Contact'),
      //         leading: ConstrainedBox(
      //           constraints: BoxConstraints(
      //             minWidth: 20,
      //             minHeight: 20,
      //             maxWidth: 30,
      //             maxHeight: 30,
      //           ),
      //           child:
      //               Image.asset('assets/images/cmdp.png', fit: BoxFit.cover),
      //         ),
      //         onTap: () {
      //           // Update the state of the app.
      //           // ...
      //         },
      //       ),
      //       ListTile(
      //         title: Text('Logout'),
      //         onTap: () async {
      //           await storage.delete(key: "jwt");
      //           // await storage.write(key: "jwt", value: null);
      //           Navigator.pushNamed(context, 'login',
      //               arguments: "I am Passed from Login");

      //           // Add your onPressed code here!
      //         },
      //         // Update the state of the app.
      //         // ...
      //       ),
      //     ],
      //   ), // Populate the Drawer in the next step.
      // ),
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
    );
  }
}
