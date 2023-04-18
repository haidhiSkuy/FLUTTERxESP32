// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_final_fields, sort_child_properties_last

import 'package:flutter/material.dart';
import 'pages/dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pages/lcd.dart';
import 'pages/led.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; //New
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = [LED(), Dashboard(), LCD()];

  final List _appbar = [
    AppBar(title: Center(child: Text("CONTROLLER"))),
    AppBar(title: Center(child: Text("DASHBOARD"))),
    AppBar(title: Center(child: Text("LCD WRITER"))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pages.elementAt(_selectedIndex)),
      appBar: _appbar.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/led.png')),
            label: 'LED Control',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/dash.png')),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/lcd.png')),
            label: 'LCD Writer',
          ),
        ],
      ),
    );
  }
}
