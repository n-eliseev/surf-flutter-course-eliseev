import 'package:flutter/material.dart';
import 'package:places/ui/res/images.dart';
import 'package:places/ui/res/themes.dart';


/// Виджет описывает текстовую кнопку с иконкой
/// в конструктор подаётся:
///   icon - иконка, которой может
///   label - подпись
///   onPressed - действие
/// кнопка сама подкрашивает иконку в соотвествующий цвет
class SvgTextButton extends StatelessWidget {

  final String icon;
  final String label;
  final VoidCallback? onPressed;
  
  const SvgTextButton({ 
    Key? key, 
    required this.icon, 
    required this.label,
    this.onPressed 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final AppThemeColor appColor = Theme.of(context).colorScheme.appColorSet;

    return TextButton.icon(
      onPressed: onPressed, 
      icon: AppImage.getSvg(
        icon,
        color: onPressed != null? appColor.textButtonColor : appColor.textButtonDisabledColor
      ),
      label: Text(label),
    );
  }
}
