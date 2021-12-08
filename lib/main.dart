import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/sight_details.dart';
import 'package:places/domain/app_strings.dart';
import 'package:places/ui/screen/visiting_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {

  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //final screen = SightListScreen(mocks);
    //final screen = SightDetails(mocks[1]);
    final screen = VisitingScreen();

    return MaterialApp(
      title: AppStrings.appTitle, //'Places',
      home: screen,
    );
  }
}
