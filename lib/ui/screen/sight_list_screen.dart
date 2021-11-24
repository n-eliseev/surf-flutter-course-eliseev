import 'package:flutter/material.dart';

class SightListScreen extends StatefulWidget {
  const SightListScreen({ Key? key }) : super(key: key);

  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 72,
        title: const Text(
          'Список\nинтересных мест',
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
            fontSize: 32,
            color: const Color(0xFF252849),
            height: 1.125
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Center(
        child: TextFormField(
          maxLength: 5,
          decoration: const InputDecoration(
            labelText: 'Input you`r text',
            hintText: 'Hint text',
            border: OutlineInputBorder()
          ),
        ), //const Text('Hello'),
      )
    );
  }
}
