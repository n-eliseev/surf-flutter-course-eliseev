import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/themes.dart';
import 'package:places/ui/res/app_strings.dart';
import 'package:places/ui/widget/svg_button.dart';
import 'package:places/ui/widget/svg_text_button.dart';
import 'package:places/ui/widget/colored_button.dart';


/// Класс описывает виджет экрана
/// показывающего конкретную карточку места
/// конструктор на входе получает объект типа Sight
class SightDetails extends StatelessWidget {

  final Sight sight;

  const SightDetails(this.sight, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width,
          theme = Theme.of(context),
          blockPadding = EdgeInsets.fromLTRB(theme.p16, theme.p24, theme.p16, 0);

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
                left: theme.p32,
                top: theme.p32,
                width:32,
                height: 32,
                child: SvgButton('arrow', onPressed: () => print('Back klicked'),) // Container(color: Colors.white, width: 32, height: 32)
              )
            ],
          ),

          Padding(
            padding: blockPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(sight.name, style: theme.textTheme.headline1),
                Text(sight.type, style: theme.textTheme.bodyText1),
              ],
            ),
          ),

          Padding(
            padding: blockPadding,
            child: Text(sight.details, style: theme.textTheme.bodyText1),
          ),

          Padding(
            padding: blockPadding.copyWith(bottom: 0),
            child: ColoredButton(
              AppStrings.createPath,
              icon: 'go',
              onPressed: () => print('Go clicked'),
            )
          ),

          Padding(
            padding: blockPadding.copyWith(bottom: 9),
            child: const Divider(),
          ),

          Padding(
            padding: blockPadding.copyWith(top:0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                const Expanded(
                  flex: 5, 
                  child: SvgTextButton(
                    icon: 'calendar', 
                    label: AppStrings.schedule,
                    onPressed: null
                  )
                ),

                Expanded(
                  flex: 5,
                  child: SvgTextButton(
                    icon: 'heart', 
                    label: AppStrings.toFavorite,
                    onPressed: () => print('Heart pressed')
                  )
                ),

              ]
            ),
          )

        ],
      )
    );
  }
}
