import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import './ui/screen/sight_list_screen.dart';
import './ui/screen/sight_details.dart';

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
      title: 'Places',
      home: screen
    );
  }
}
