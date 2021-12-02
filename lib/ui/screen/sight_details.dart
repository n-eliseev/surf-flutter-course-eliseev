import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import '../../domain/sight.dart';

class SightDetails extends StatelessWidget {

  const SightDetails({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    Sight sight = mocks[0];

    final width = MediaQuery.of(context).size.width;
    const double _p1 = 16;
    const double _p2 = 24;
    const textColor = const Color(0xFF3B3E5B);
    const h1Style = const TextStyle(color: textColor, fontSize: 24, height: 1.2);
    const textStyle = const TextStyle(color: textColor, fontSize: 14, height: 1.1);
    const blockPadding = EdgeInsets.fromLTRB(_p1, _p2, _p1, 0);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [

          Stack(
            children: [
              Container(
                color: Colors.blue,
                width: width,
                height: 360,
              ),
              Positioned(
                left: _p1,
                top: _p1*2,
                child: Container(color: Colors.white, width: 32, height: 32)
              )
            ],
          ),

          Padding(
            padding: blockPadding,
            child: RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold
                ),
                children: [
                  TextSpan(text: sight.name, style: h1Style),
                  const TextSpan(text: '\n'),
                  TextSpan(text: sight.type, style: textStyle),
                ]
              )
            ),
          ),

          Padding(
            padding: blockPadding,
            child: Text(sight.details, style: textStyle),
          ),

          Padding(
            padding: blockPadding,
            child: Container(
              height: 48, 
              width: width,
              decoration: const BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                color: Colors.green
              ),
            ),
          ),

          Padding(
            padding: blockPadding,
            child: const Divider(thickness: 0.8, color: Color.fromRGBO(124, 126, 146, 0.56))
          ),

          Padding(
            padding: blockPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(color: Colors.grey, width: width / 2 - _p1*2, height: 40),
                Container(color: Colors.blue, width: width / 2 - _p1*2, height: 40)
              ]
            ),
          )

        ],
      )
    );
  }
}
