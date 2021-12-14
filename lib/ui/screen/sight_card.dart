import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:places/domain/sight.dart';
import 'package:places/domain/app_ui.dart';


/// Класс описывает виджет карточку (превью) интересного места
/// На входе получает объект класса Sight
class SightCard extends StatelessWidget {

  final Sight sight; 

  const SightCard(this.sight, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Card(
      //child: ,
      
      child: Column(
        children: [

          Stack(
            children:[
              
              SizedBox(
                width: double.infinity,
                height: 96,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(AppUi.p16),
                    topRight: Radius.circular(AppUi.p16)
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
                )
              ),

              Positioned(
                top: AppUi.p16,
                left: AppUi.p16,
                child: Text(
                  sight.type.toLowerCase(), 
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.white)
                )
              ),

              Positioned(
                top: AppUi.p16,
                right: AppUi.p16,
                child: Container(color: Colors.white, width: 20, height: 18)
              ),
            ]
          ),

          SizedBox(
            width: double.infinity,
            height: 92,
            child: Padding(
              padding: const EdgeInsets.all(AppUi.p16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    sight.name,
                    style: Theme.of(context).textTheme.headline3
                  ),
                  Text(
                    sight.details,
                    style: Theme.of(context).textTheme.bodyText2
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
