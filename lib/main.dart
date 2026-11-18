import 'package:flutter/material.dart';

import 'screen1.dart';
import 'screen2.dart';
import 'screen3.dart';
import 'screen4.dart';
import 'lab_b_screen.dart'; // Import your Lab B screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TMA3084 Lab 05 - G02',
      theme: ThemeData(primarySwatch: Colors.blue),
      // Change this to const LabBScreen() if you want to test Lab B directly,
      // or keep it as const MainScreen() for Lab A's bottom navigation.
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // 1. List of the four screens for Lab A
  final List<Widget> _screens = [
    const Screen1(), // Home
    const Screen2(), // Alarm
    const Screen3(), // Business
    const Screen4(), // School
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lab A - Tab ${_currentIndex + 1}'),
        actions: [
          // Quick helper button in the app bar to switch to Lab B view for screenshots
          IconButton(
            icon: const Icon(Icons.table_chart),
            tooltip: 'View Lab B (DataTable)',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LabBScreen()),
              );
            },
          ),
        ],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.alarm), label: 'Alarm'),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
        ],
      ),
    );
  }
}

// Lab 05 PR review demo
