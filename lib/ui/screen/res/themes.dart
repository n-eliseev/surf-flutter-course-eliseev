import 'package:flutter/material.dart';
import 'package:places/domain/app_ui.dart';


/// Статический класс для хранения тем и стилевых элементов приложения
/// Имеет две темы: light и dark
/// Помимо этого:
///  - Цвета, которые повторяются или участвуют в оформлении вынесены в отдельные переменные
///  - Оформление текста (без указания цвета), также вынесено отдельно
/// 
/// Темы и стилевые блоки строятся по принципу наследования (в данном случаи копирования copyWith)
/// чтоб обеспечить одинаковый набор свойств и менять только то, что являеться иным для конкретного
/// блока. Т.е. например: тема dark - это клон light, с заменой свойст
/// 
class AppTheme {
  
  static const color1 = Color(0xFF3B3E5B);
  static const color2 = Color(0xFF7C7E92);
  static const color3 = Color.fromRGBO(124, 126, 146, 0.56);

  static const commonText = TextStyle(
    fontFamily: "Roboto",
    fontStyle : FontStyle.normal,
  );

  static final bodyText = commonText.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.1
  );

  static final headerText = commonText.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: 32,
    height: 1.125
  );

  static final light = ThemeData(

    scaffoldBackgroundColor: Colors.white,

    canvasColor: Colors.white,

    textTheme: TextTheme(
      headline1: commonText.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        height: 1.2,
        color: color1 //const Color(0xFF3B3E5B)
      ),
      headline2: commonText.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        height: 1.14,
        color: color1 //const Color(0xFF3B3E5B)
      ),
      headline3: commonText.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1.07,
        color: color1 //const Color(0xFF3B3E5B)
      ),
      bodyText1: bodyText.copyWith(
        color: color1 //const Color(0xFF3B3E5B),
      ),
      bodyText2: bodyText.copyWith(
        color: color2 //const Color(0xFF7C7E92),
      ),
    ),

    tabBarTheme: TabBarTheme(
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: color1 //const Color(0xFF3B3E5B),
      ),
      labelStyle: commonText.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: 14,
        height: 1.1
      ),
      unselectedLabelColor: color3 //const Color.fromRGBO(124, 126, 146, 0.56)
    ),

    cardTheme: const CardTheme(
      color: Color(0xFFF5F5F5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppUi.p16),
          topRight: Radius.circular(AppUi.p16),
          bottomLeft: Radius.circular(AppUi.p12),
          bottomRight: Radius.circular(AppUi.p12),
        ),
      ),
      elevation: 0,
      shadowColor: Colors.transparent
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Color(0xFF252849),
      unselectedItemColor: color1, //Color(0xFF3B3E5B),
      showUnselectedLabels: false,
      showSelectedLabels: false,
    ),

  );

  static final dark = light.copyWith(

    scaffoldBackgroundColor: const Color(0xFF21222C),
    
    canvasColor: const Color(0xFF21222C),

    textTheme: light.textTheme.copyWith(
      
      headline1: light.textTheme.headline1?.copyWith(color: Colors.white),

      headline2: light.textTheme.headline2?.copyWith(color: Colors.white),
      
      headline3: light.textTheme.headline3?.copyWith(color: Colors.white),

      bodyText1: light.textTheme.bodyText1?.copyWith(color: Colors.white),
    ),

    tabBarTheme: light.tabBarTheme.copyWith(
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.white,
      ),
      labelColor: color1, //const Color(0xFF3B3E5B),
      unselectedLabelColor: color2, //const Color(0xFF7C7E92),
    ),

    cardTheme: light.cardTheme.copyWith(
      color: const Color(0xFF1A1A20),
    ),

    bottomNavigationBarTheme: light.bottomNavigationBarTheme.copyWith(
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
    ),
  );
}
