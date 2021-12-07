import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/mocks.dart';
import 'package:places/domain/app_strings.dart';
import 'package:places/domain/app_ui.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  
  final double height;
  final Color color;

  const CustomAppBar({
    required this.height, 
    required this.color 
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
      backgroundColor: color,
      elevation: 0.0,
      toolbarHeight: height,
    );
  }
}

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
      appBar: CustomAppBar(height: 72, color: Theme.of(context).scaffoldBackgroundColor),
      /*AppBar(
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
      ),*/
      body: Column(children: cards)
    );
  }
}
