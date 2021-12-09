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
    
    //Sight sight = mocks[0];

    final width = MediaQuery.of(context).size.width;
    const double _p16 = AppUi.p16;
    const double _p24 = AppUi.p24;
    const textColor = Color(0xFF3B3E5B);
    const h1Style = TextStyle(color: textColor, fontSize: 24, height: 1.2);
    const textStyle = TextStyle(color: textColor, fontSize: 14, height: 1.1);
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
