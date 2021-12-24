import 'package:flutter/material.dart';
import 'package:places/ui/res/images.dart';

/// Виджет навигационного меню
class BottomNavBar extends StatelessWidget {
  
  const BottomNavBar({ Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 2,

      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: AppImage.getSvg('list'),
          activeIcon: AppImage.getSvg('list-full'),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: AppImage.getSvg('map'),
          activeIcon: AppImage.getSvg('map-full'),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: AppImage.getSvg('heart'),
          activeIcon: AppImage.getSvg('heart-full'),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: AppImage.getSvg('settings'),
          activeIcon: AppImage.getSvg('settings-full'),
          label: '',
        ),
      ],
    );
  }
}
