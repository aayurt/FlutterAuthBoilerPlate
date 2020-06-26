import 'package:flutter/material.dart';
import 'package:flutter_auth/Drawer/drawer.dart';
import 'dart:math';

class NewAnimate extends StatefulWidget {
  @override
  _NewAnimateState createState() => _NewAnimateState();
}

class _NewAnimateState extends State<NewAnimate> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Animate")),
        drawer: AppDrawer(),
        body: Center(
          child: AnimatedContainer(
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              color: _color,
              borderRadius: _borderRadius,
            ),
            duration: Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.play_arrow),
            // When the user taps the button
            onPressed: () {
              // Use setState to rebuild the widget with new values.
              setState(() {
                // Create a random number generator.
                final random = Random();

                // Generate a random width and height.
                _width = random.nextInt(300).toDouble();
                _height = random.nextInt(300).toDouble();

                // Generate a random color.
                _color = Color.fromRGBO(
                  random.nextInt(256),
                  random.nextInt(256),
                  random.nextInt(256),
                  1,
                );

                // Generate a random border radius.
                _borderRadius =
                    BorderRadius.circular(random.nextInt(100).toDouble());
              });
            }));
  }
}
