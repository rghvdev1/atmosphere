// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:sdgproject/pages/challenges.dart';
import 'package:sdgproject/pages/home.dart';
import 'package:sdgproject/pages/profile.dart';

class Nav extends StatefulWidget {
  const Nav({
    super.key,
  });

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    const Home(),
    const Challenges(),
    const Profile()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Overview',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: 'Challenges',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Profile')
        ],
      ),
    );
  }
}
