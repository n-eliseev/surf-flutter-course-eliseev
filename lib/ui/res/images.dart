import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


/// Клас обёртка для упращённой работы с картинками/иконками из ассетов
/// Содержит два метода:
///  - getAssetName - который вернёт полное имя ассета, по короткому имени
///  - getSvg - вернёт SvgPicture объект с заднным ассетом (по которкому имени,
///     размерам и цвету)
/// 
/// Короткое имя ассета - это имя бер расширения, не важно в каком регистре и 
/// без полного пути. Например:
///   ассет с полным именем res/icons/List.svg - имеет короткое имя list
///   Если нам надо получить картинку этого ассета, то достаточно вызвать:
///     getSvg('list', size:20) 
///   Получим объект SvgPicture этого ассета с размерами 20
class AppImage {
  
  static const String iconPath = 'res/icons/';

  static const List<String> icons = [
    'List','List-full',
    'Map','Map-full',
    'Heart','Heart-full',
    'Settings', 'Settings-full',
    'Calendar', 'Calendar-full',
    'Go'
  ];

  static String getAssetName(String id) {

    final _id = id[0].toUpperCase() + id.toLowerCase().substring(1);

    if(!icons.contains(_id)) {
      throw 'Svg Picture is $id undefined';
    }

    return '$iconPath$_id.svg';
  }

  static SvgPicture getSvg(String id, {double? size, Color? color}) {
    return SvgPicture.asset(
      getAssetName(id),
      width: size, 
      height: size, 
      color: color
    );
  }
}
