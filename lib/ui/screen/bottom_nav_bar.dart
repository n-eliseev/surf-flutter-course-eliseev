import 'package:flutter/material.dart';

/// Виджет навигационного меню
class BottomNavBar extends StatelessWidget {
  
  const BottomNavBar({ Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 2,
      
      //selectedItemColor: const Color(0xFF252849),
      //unselectedItemColor: const Color(0xFF252849),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt_sharp),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: '',
        ),
      ],
    );
  }
}
