import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/sight_details.dart';
import 'package:places/ui/res/app_strings.dart';
import 'package:places/ui/screen/visiting_screen.dart';
import 'package:places/ui/res/themes.dart';


void main() {
  runApp(const App());
}


class App extends StatelessWidget {

  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Widget screen;

    const screenId = 1,
          isDark = false;

    if (screenId == 0) {
      screen = SightListScreen(mocks);
    } 
    else if(screenId == 1) {
      screen = SightDetails(mocks[1]);
    }
    else {
      screen = const VisitingScreen();
    }

    return MaterialApp(
      title: AppStrings.appTitle,
      home: screen,
      theme: isDark ? AppTheme.dark : AppTheme.light
    );
  }
}
