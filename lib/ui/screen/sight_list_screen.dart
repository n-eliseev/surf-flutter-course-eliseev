import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import './sight_card.dart';
import '../../mocks.dart';

class SightListScreen extends StatefulWidget {
  const SightListScreen({ Key? key }) : super(key: key);

  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {

    const double _pd = 16;
    final cards = <Widget>[];

    for(final _s in mocks) {
      cards.add(
        Padding(
          padding: EdgeInsets.fromLTRB(_pd, _pd, _pd, 0),
          child: SightCard(_s)
        )
      );
    }

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
      body: Column(children: cards)
    );
  }
}
