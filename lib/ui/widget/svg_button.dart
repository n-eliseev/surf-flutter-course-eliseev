import 'package:flutter/material.dart';
import 'package:places/ui/res/images.dart';
import 'package:places/ui/res/themes.dart';


/// Виджет описывает кнопку с окрашенным БГ и иконкой
/// в конструктор подаётся:
///   icon - иконка, которой может
///   backgroundColor - цвет фона, не обязательный (если не указан то берётся цвет фона)
///   svgColor - цвет картинки, не обязательный (если не указан то берётся цвет фона)
///   radius - скругление, не обязательный (если не указан то берётся r12 из темы контекста)
///   onPressed - действие
class SvgButton extends StatelessWidget {

  final String icon;
  final Color? backgroundColor;
  final Color? svgColor;
  final BorderRadius? radius;
  final VoidCallback? onPressed;
  
  const SvgButton(
    this.icon, { 
    Key? key,
    this.backgroundColor, 
    this.svgColor,
    this.radius, 
    this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final theme = Theme.of(context);
    final bgColor = backgroundColor ?? theme.scaffoldBackgroundColor;
    final iconColor = svgColor ?? theme.textTheme.bodyText1?.color;
    final r = radius ?? theme.r10brc;

    return OutlinedButton(
      onPressed: onPressed, 
      child: AppImage.getSvg(icon , color: iconColor),
      style:OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: r),
        primary: iconColor,
        backgroundColor: bgColor,
        padding: EdgeInsets.zero
      )
    );
  }
}
