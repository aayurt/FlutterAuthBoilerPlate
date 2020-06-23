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
    );
  }
}
