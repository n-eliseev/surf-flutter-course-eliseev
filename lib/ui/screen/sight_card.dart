import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';

class SightCard extends StatelessWidget {

  final Sight sight; 

  const SightCard(this.sight, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    const double tRadius = 16;
    const double bRadius = 12;

    return Column(
      children: [
        
        Stack(
          children:[
            
            Container(
              width: width,
              height: 96,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(tRadius),
                  topRight: const Radius.circular(tRadius)
                ),
                color: Colors.lightBlue
              )
            ),

            Positioned(
              top: tRadius,
              left: tRadius,
              child: Text(sight.type.toLowerCase(), style: const TextStyle(color: Colors.white, height: 1.1, fontSize: 14))
            ),
            
            Positioned(
              top: tRadius,
              right: tRadius,
              child: Container(color: Colors.white, width: 20, height: 18)
            ),
          ]
        ),
        
        Container(
          width: width,
          height: 92,
          decoration: const BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: const Radius.circular(bRadius), 
              bottomRight: const Radius.circular(bRadius) 
            ),
            color: const Color(0xFFF5F5F5)
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child:RichText(
              text: TextSpan(
                style: TextStyle( fontFamily: 'Roboto'),
                children: [
                  TextSpan(text: sight.name, style: const TextStyle(color: const Color(0xFF3B3E5B), fontSize: 16, height: 1.07 )),
                  const TextSpan(text:'\n'),
                  TextSpan(text: sight.details, style: const TextStyle(color: const Color(0xFF7C7E92), fontSize: 14, height: 1.1 )),
                ]
              )
            ),
          )
        )

      ]
    );
  
  }
}
