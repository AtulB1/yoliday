import 'package:flutter/material.dart';
import 'package:yoliday/PortfolioScreen.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 1; 

  final List<Widget> _screens = [
    Scaffold(body: Center(child: Text('Home Screen'))),
    PortfolioScreen(),
    Scaffold(body: Center(child: Text('Input Screen'))),
    Scaffold(body: Center(child: Text('Profile Screen'))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: 'Portfolio'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: 'Input'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}