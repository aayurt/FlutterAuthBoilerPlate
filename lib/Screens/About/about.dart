import 'package:flutter/material.dart';
import 'package:flutter_auth/Drawer/drawer.dart';
// void _onItemTapped{
//   setState(() {
//       _selectedIndex = index;
//     });
//   }

class About extends StatelessWidget {
  // let _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(title: Text("About")),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
        // currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        // onTap: _onItemTapped,
      ),
    );
  }
}
