import 'package:flutter/material.dart';
import 'package:instant_bottom_bar/instant_bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Instant Bottom Bar demo',
      home: ShiftingBottomNavigationBar(
          selectedItColor: Colors.white,
          unselectedItColor: Colors.white60,
          backgroundColor: Colors.blue,
          tabs: [
            BottomNavigationTabData(
                icon: Icons.person,
                label: 'Account',
                widget: Center(child: Text('This is screen one'))),
            BottomNavigationTabData(
                icon: Icons.home,
                label: 'Home',
                widget: Center(child: Text('This is screen two'))),
            BottomNavigationTabData(
                icon: Icons.settings,
                label: 'Settings',
                widget: Center(child: Text('This is screen three')))
          ]),
    );
  }
}
