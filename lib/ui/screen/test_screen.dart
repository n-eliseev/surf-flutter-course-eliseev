import 'package:flutter/material.dart';
import 'package:places/domain/app_const.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({ Key? key }) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 72,
        title: const Text(
          AppStrings.appBarTitle,
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
      body: Container(
        color: Colors.green,
        width:double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width:150,
              height: 150,
              color: Colors.blue,
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(Size(100,80)),
                child: Column(
                  children: [
                    Container(color: Colors.white)
                  ]
                )
              )
            )
          ]
        )
      )
    );
  
  }
}
