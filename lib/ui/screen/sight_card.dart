import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:places/domain/sight.dart';
import 'package:places/domain/app_ui.dart';


/**
 * Класс описывает виджет карточку (превью) интересного места
 * На входе получает объект класса Sight
 */
class SightCard extends StatelessWidget {

  final Sight sight; 

  const SightCard(this.sight, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        Stack(
          children:[
            
            Container(
              width: double.infinity,
              height: 96,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(AppUi.p16),
                  topRight: const Radius.circular(AppUi.p16)
                ),
                //color: Colors.lightBlue
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(AppUi.p16),
                  topRight: const Radius.circular(AppUi.p16)
                ),
                child: Image.network(
                  sight.image,
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                  loadingBuilder: (context, child, loadingProgress) {
                    
                    if (loadingProgress == null) return child;

                    return Center(
                      child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null ?
                                    loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                      :
                                  null,
                      ),
                    );
                  },
                ),
              ),
            ),

            Positioned(
              top: AppUi.p16,
              left: AppUi.p16,
              child: Text(sight.type.toLowerCase(), style: const TextStyle(color: Colors.white, height: 1.1, fontSize: 14))
            ),

            Positioned(
              top: AppUi.p16,
              right: AppUi.p16,
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
              bottomLeft: const Radius.circular(AppUi.p12), 
              bottomRight: const Radius.circular(AppUi.p12) 
            ),
            color: const Color(0xFFF5F5F5),
          ),
          child: Padding(
            padding: EdgeInsets.all(AppUi.p16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  sight.name,
                  style:const TextStyle( fontFamily: 'Roboto', color: const Color(0xFF3B3E5B), fontSize: 16, height: 1.07 )
                ),
                Text(
                  sight.details,
                  style:const TextStyle( fontFamily: 'Roboto', color: const Color(0xFF7C7E92), fontSize: 14, height: 1.1 )
                ),
              ],
            )
          )
        )
      ]
    );
  }
}
