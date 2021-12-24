import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/images.dart';
import 'package:places/ui/res/themes.dart';


/// Виджет описывает кнопку с окрашенным БГ
/// в конструктор подаётся:
///   icon - иконка, которой может
///   label - подпись
///   onPressed - действие
/// кнопка сама подкрашивает иконку в соотвествующий цвет
class ColoredButton extends StatelessWidget {

  final String? icon;
  final String label;
  final VoidCallback? onPressed;
  
  const ColoredButton(
    this.label, { 
    Key? key,
    this.icon, 
    this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final AppThemeColor appColor = Theme.of(context).colorScheme.appColorSet;

    final Text _label = onPressed !=null ? 
                        Text(label.toUpperCase()) : 
                        Text(label.toUpperCase(), style: TextStyle(color: appColor.buttonTextDisabledColor));

    final SvgPicture? _icon = icon != null ? 
                              AppImage.getSvg(
                                icon.toString(), 
                                color: onPressed != null? appColor.buttonTextColor : appColor.buttonTextDisabledColor
                              ) :
                              null;
    
    Widget content = _label;

    if(_icon != null) {
      content = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ _icon, const SizedBox(width: 10), _label ],
      );
    }

    return OutlinedButton(
      onPressed: onPressed, 
      child: content
    );
  }
}
