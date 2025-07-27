import 'package:flutter/material.dart';
import 'package:nav/screen1.dart';
import 'package:nav/screen2.dart';
import 'package:nav/screen3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Aufgabe',
      // TODO: Hier wird später die BottomNavigationBar konfiguriert
      home: Navigation(),
    );
  }
}

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<StatefulWidget> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentIndex = 0;
  List<Widget> screens = [Screen1(), Screen2(), Screen3()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int Index) {
          setState(() {
            currentIndex = Index;
          });
        },
        indicatorColor: Colors.lightGreen,
        selectedIndex: currentIndex,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.one_k), label: "Screen 1"),
          NavigationDestination(icon: Icon(Icons.two_k), label: "Screen 2"),
          NavigationDestination(icon: Icon(Icons.three_k), label: "Screen 3"),
        ],
      ),
      body: Center(child: screens[currentIndex]),
    );
  }
}
