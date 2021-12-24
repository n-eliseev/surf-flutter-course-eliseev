import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/themes.dart';
import 'package:places/ui/res/images.dart';


/// Класс описывает виджет карточку (превью) интересного места
/// На входе получает объект класса Sight
class SightCard extends StatelessWidget {

  final Sight sight; 

  const SightCard(this.sight, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return Card(
      
      child: Column(
        children: [

          Stack(
            children:[
              
              SizedBox(
                width: double.infinity,
                height: 96,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: theme.r16c,
                    topRight: theme.r16c
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
                top: theme.p16,
                left: theme.p16,
                child: Text(
                  sight.type.toLowerCase(), 
                  style: theme.textTheme.bodyText1?.copyWith(color: Colors.white)
                )
              ),

              Positioned(
                top: theme.p16,
                right: theme.p16,
                child: IconButton(
                  icon: AppImage.getSvg('heart'),
                  onPressed: () => print('Like pressed'),
                  iconSize: 20,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
                )
              ),
            ]
          ),

          SizedBox(
            width: double.infinity,
            height: 92,
            child: Padding(
              padding: EdgeInsets.all(theme.p16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(sight.name, style: theme.textTheme.headline3),
                  Text(sight.details, style: theme.textTheme.bodyText2),
                ],
              )
            )
          )
        ]
      )
    );
  }
}
