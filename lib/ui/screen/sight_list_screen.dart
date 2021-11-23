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
