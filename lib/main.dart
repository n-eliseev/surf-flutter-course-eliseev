import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/sight_details.dart';
import 'package:places/domain/app_const.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {

  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //const screen = const SightListScreen();
    const screen = SightDetails();

    return const MaterialApp(
      title: AppStrings.appTitle, //'Places',
      home: screen
    );
  }
}
