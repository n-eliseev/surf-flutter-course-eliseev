import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:places/domain/sight.dart';
import 'package:places/domain/app_const.dart';

class SightCard extends StatelessWidget {

  final Sight sight; 

  const SightCard(this.sight, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width;
    const double tRadius = AppUi.p16;
    const double bRadius = AppUi.p12;

    return AspectRatio(
      aspectRatio: 3/2,
      child: Column(
        children: [
          
          Stack(
            children:[
              
              Container(
                width: double.infinity,
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
            width: double.infinity,
            height: 92,
            //constraints: BoxConstraints(minWidth: width), 
            decoration: const BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: const Radius.circular(bRadius), 
                bottomRight: const Radius.circular(bRadius) 
              ),
              color: const Color(0xFFF5F5F5),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(AppUi.p16, 0, AppUi.p16, AppUi.p16), //EdgeInsets.all(AppUi.p16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: AppUi.p16),
                  Text(
                    sight.name,
                    style:const TextStyle( fontFamily: 'Roboto', color: const Color(0xFF3B3E5B), fontSize: 16, height: 1.07 )
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: width/2), 
                    child: Text(
                      sight.details,
                      style:const TextStyle( fontFamily: 'Roboto', color: const Color(0xFF7C7E92), fontSize: 14, height: 1.1 )
                    )
                  ),
                ],
              )
            )
          )

        ]
      )
    );

  }
}
