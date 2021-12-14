import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/domain/app_ui.dart';


/// Класс описывает виджет экрана
/// показывающего конкретную карточку места
/// конструктор на входе получает объект типа Sight
class SightDetails extends StatelessWidget {

  final Sight sight;

  const SightDetails(this.sight, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    const double _p16 = AppUi.p16;
    const double _p24 = AppUi.p24;
    const blockPadding = EdgeInsets.fromLTRB(_p16, _p24, _p16, 0);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [

          Stack(
            children: [
              
              SizedBox(
                width: width,
                height: 360,
                child: Image.network(
                  sight.image,
                  fit: BoxFit.cover,
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
              
              Positioned(
                left: _p16,
                top: _p16*2,
                child: Container(color: Colors.white, width: 32, height: 32)
              )
            ],
          ),

          Padding(
            padding: blockPadding,
            child: RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                children: [
                  TextSpan(text: sight.name, style: Theme.of(context).textTheme.headline1),
                  const TextSpan(text: '\n'),
                  TextSpan(text: sight.type, style: Theme.of(context).textTheme.bodyText1),
                ]
              )
            ),
          ),

          Padding(
            padding: blockPadding,
            child: Text(sight.details, style: Theme.of(context).textTheme.bodyText1),
          ),

          Padding(
            padding: blockPadding,
            child: Container(
              height: 48, 
              width: width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(AppUi.p12)),
                color: Colors.green
              ),
            ),
          ),

          const Padding(
            padding: blockPadding,
            child: Divider(thickness: 0.8, color: Color.fromRGBO(124, 126, 146, 0.56))
          ),

          Padding(
            padding: blockPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(color: Colors.grey, width: width / 2 - _p16*2, height: 40),
                Container(color: Colors.blue, width: width / 2 - _p16*2, height: 40)
              ]
            ),
          )

        ],
      )
    );
  }
}
