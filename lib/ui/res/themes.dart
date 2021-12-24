import 'package:flutter/material.dart';


/// Класс описывает основной набор цветов, для темы
///   цвет white - сделаем по умолчанию (нам повезло - оттенков белого дизайнер не нашёл :) ) 
///   цвет dark - по умолчанию Null, задумка не ясна - он есть только в одном наборе
/// Содержит два статических поля:
///   - lightColorSet - набор ветов для светлой темы
///   - darkColorSet - для тёмной
class AppThemeColor {

  final Color green;
  final Color yellow;
  final Color red;
  final Color white;
  final Color main;
  final Color secondary;
  final Color secondary2;
  final Color inactiveBlack;
  final Color background;
  final Color dark;
  final Color textButtonColor;
  final Color textButtonDisabledColor;
  final Color buttonBackgroundColor;
  final Color buttonDisabledBackgroundColor;
  final Color buttonTextColor;
  final Color buttonTextDisabledColor;

  const AppThemeColor({
    this.white = Colors.white,
    required this.green, 
    required this.yellow, 
    required this.red,
    required this.main,
    required this.secondary,
    required this.secondary2,
    required this.inactiveBlack,
    required this.background,
    required this.dark,
    required this.textButtonColor,
    required this.textButtonDisabledColor,
    required this.buttonBackgroundColor,
    required this.buttonDisabledBackgroundColor,
    required this.buttonTextColor,
    required this.buttonTextDisabledColor,
  });

  AppThemeColor copyWith({
    Color? green, 
    Color? yellow, 
    Color? red,
    Color? white,
    Color? main,
    Color? secondary,
    Color? secondary2,
    Color? inactiveBlack,
    Color? background,
    Color? dark,
    Color? textButtonColor,
    Color? textButtonDisabledColor,
    Color? buttonBackgroundColor,
    Color? buttonDisabledBackgroundColor,
    Color? buttonTextColor,
    Color? buttonTextDisabledColor,
  }) {
    return AppThemeColor(
      green: green ?? this.green, 
      yellow: yellow ?? this.yellow, 
      red: red ?? this.red, 
      white: white ?? this.white, 
      main: main ?? this.main, 
      secondary: secondary ?? this.secondary, 
      secondary2: secondary2 ?? this.secondary2, 
      inactiveBlack: inactiveBlack ?? this.inactiveBlack, 
      background: background ?? this.background,
      dark: dark ?? this.dark,
      textButtonColor: textButtonColor ?? this.textButtonColor,
      textButtonDisabledColor: textButtonDisabledColor ?? this.textButtonDisabledColor,
      buttonBackgroundColor : buttonBackgroundColor ?? this.buttonBackgroundColor,
      buttonDisabledBackgroundColor: buttonDisabledBackgroundColor ?? this.buttonDisabledBackgroundColor,
      buttonTextColor : buttonTextColor ?? this.buttonTextColor,
      buttonTextDisabledColor : buttonTextDisabledColor ?? this.buttonTextDisabledColor,
    );
  }

  /// Цветовая палитра для светлой темы
  static const AppThemeColor lightColorSet = AppThemeColor(
    green: Color(0xFF4CAF50),
    yellow: Color(0xFFFCDD3D),
    red: Color(0xFFEF4343),
    main: Color(0xFF252849),
    secondary: Color(0xFF3B3E5B),
    secondary2: Color(0xFF7C7E92),
    inactiveBlack: Color.fromRGBO(124, 126, 146, 0.56),
    background: Color(0xFFF5F5F5),
    dark: Color(0xFF1A1A20),
    textButtonColor: Color(0xFF3B3E5B),
    textButtonDisabledColor: Color.fromRGBO(124, 126, 146, 0.56),
    buttonBackgroundColor: Color(0xFF4CAF50),
    buttonDisabledBackgroundColor: Color(0xFFF5F5F5),
    buttonTextColor : Colors.white,
    buttonTextDisabledColor : Color.fromRGBO(124, 126, 146, 0.56),
  );

  /// Цветовая палитра для тёмной темы
  static final AppThemeColor darkColorSet = lightColorSet.copyWith(
    green: const Color(0xFF6ADA6F),
    yellow: const Color(0xFFFFE769),
    red: const Color(0xFFCF2A2A),
    main: const Color(0xFF21222C),
    textButtonColor: Colors.white,
    buttonDisabledBackgroundColor: const Color(0xFF1A1A20),
  );

}


/// Расширение для указания возвожных оступов
extension AppThemeSpacing on ThemeData {
  double get p16 => 16;
  double get p12 => 12;
  double get p24 => 24;
  double get p32 => 32;
}


/// Расширение для указания возвожных радиусов
extension AppThemeRadius on ThemeData {

  double get r12 => 12;
  double get r16 => 16;
  double get r40 => 40;

  Radius get r12c => Radius.circular(r12);
  Radius get r16c => Radius.circular(r16);
  Radius get r40c => Radius.circular(r40);

  BorderRadius get r12brc => BorderRadius.circular(r12);
  BorderRadius get r16brc => BorderRadius.circular(r16);
  BorderRadius get r40brc => BorderRadius.circular(r40);
}


/// Расширение, которое дополняет класс с цветовой схемой полем appColorSet, которое
/// описывает набор цветов для текущей темы (светлой или тёмно)
extension AppThemeColorScheme on ColorScheme {
  AppThemeColor get appColorSet => brightness == Brightness.light ? AppThemeColor.lightColorSet : AppThemeColor.darkColorSet; 
}


/// Статический класс для хранения тем и стилевых элементов приложения
/// Имеет две темы: light и dark
/// Помимо этого:
///  - Цвета, которые повторяются или участвуют в оформлении вынесены в отдельные переменные
///  - Оформление текста (без указания цвета), также вынесено отдельно
/// 
/// Темы и стилевые блоки строятся по принципу наследования (в данном случаи копирования copyWith)
/// чтоб обеспечить одинаковый набор свойств и менять только то, что являеться иным для конкретного
/// блока.
/// 
/// Метот _duildTheme - нужен для того чтоб задать в текущую тему общие правила: размеры, скругления
/// отспуты и т.п. 
/// Сами темы - это два статических свойства light и dark, которые берут общее из _buildTheme
/// и добавляют частное: цвета, например.
class AppTheme {
  
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

  static ThemeData _buildTheme(ThemeData theme) {
    return theme.copyWith(
      textTheme: theme.textTheme.copyWith(
        headline1: commonText.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          height: 1.2,
        ),
        headline2: commonText.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          height: 1.14,
        ),
        headline3: commonText.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 1.07
        ),
        bodyText1: bodyText,
        bodyText2: bodyText,
      ),

      tabBarTheme: theme.tabBarTheme.copyWith(
        indicator: BoxDecoration(
          borderRadius: theme.r40brc
        ),
        labelStyle: bodyText.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),

      cardTheme: theme.cardTheme.copyWith(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top : theme.r16c, 
            bottom: theme.r12c
          )
        ),
        elevation: 0,
        shadowColor: Colors.transparent
      ),

      bottomNavigationBarTheme: theme.bottomNavigationBarTheme.copyWith(
        showUnselectedLabels: false,
        showSelectedLabels: false,
      ),

      dividerTheme: DividerThemeData(
        thickness: 0.8,
        space: 0,
        color: theme.colorScheme.appColorSet.inactiveBlack
      ),

      textButtonTheme: TextButtonThemeData(
        style : TextButton.styleFrom(
          primary: theme.colorScheme.appColorSet.textButtonColor,
          onSurface: theme.colorScheme.appColorSet.textButtonDisabledColor,
          textStyle: bodyText,
        )
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style:OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: theme.r12brc),
          side: const BorderSide(style: BorderStyle.none),
          primary: theme.colorScheme.appColorSet.buttonTextColor,
          backgroundColor: theme.colorScheme.appColorSet.buttonBackgroundColor,
          onSurface: theme.colorScheme.appColorSet.buttonDisabledBackgroundColor,
          textStyle: bodyText.copyWith(
            fontWeight: FontWeight.bold
          ),
          minimumSize: const Size.fromHeight(48)
        )
      )
    );
  }
  
  /// Оформление светлой темы
  static ThemeData get light {
    
    final theme = _buildTheme(ThemeData.light()),
          colorSet = theme.colorScheme.appColorSet;

    return theme.copyWith(
      
      scaffoldBackgroundColor: colorSet.white,

      canvasColor: colorSet.white,

      textTheme: theme.textTheme.copyWith(
        headline1: theme.textTheme.headline1?.copyWith( color: colorSet.secondary ),
        headline2: theme.textTheme.headline2?.copyWith( color: colorSet.secondary ),
        headline3: theme.textTheme.headline3?.copyWith( color: colorSet.secondary ),
        bodyText1: theme.textTheme.bodyText1?.copyWith( color: colorSet.secondary ),
        bodyText2: theme.textTheme.bodyText2?.copyWith( color: colorSet.secondary ),
      ),

      tabBarTheme: theme.tabBarTheme.copyWith(
        indicator: BoxDecoration(
          borderRadius: theme.r40brc,
          color: colorSet.secondary //const Color(0xFF3B3E5B),
        ),
        unselectedLabelColor: colorSet.inactiveBlack
      ),

      cardTheme: theme.cardTheme.copyWith( color: colorSet.background ),

      bottomNavigationBarTheme: theme.bottomNavigationBarTheme.copyWith(
        backgroundColor: colorSet.white,
        selectedItemColor: colorSet.main,
        unselectedItemColor: colorSet.secondary,
      )
    );
  }

  /// Описание тёмной темы 
  static ThemeData get dark {

    final theme = _buildTheme(ThemeData.dark()),
          colorSet = theme.colorScheme.appColorSet;

    return theme.copyWith(

      scaffoldBackgroundColor: colorSet.main,

      canvasColor: colorSet.main,

      textTheme: theme.textTheme.copyWith(
        headline1: theme.textTheme.headline1?.copyWith(color: colorSet.white),
        headline2: theme.textTheme.headline2?.copyWith(color: colorSet.white),
        headline3: theme.textTheme.headline3?.copyWith(color: colorSet.white),
        bodyText1: theme.textTheme.bodyText1?.copyWith(color: colorSet.white),
        bodyText2: theme.textTheme.bodyText2?.copyWith(color: colorSet.white),
      ),

      tabBarTheme: theme.tabBarTheme.copyWith(
        indicator: BoxDecoration(
          borderRadius: theme.r40brc,
          color: colorSet.white,
        ),
        labelColor: colorSet.secondary,
        unselectedLabelColor: colorSet.secondary2,
      ),

      cardTheme: theme.cardTheme.copyWith(
        color: colorSet.dark,
      ),

      bottomNavigationBarTheme: theme.bottomNavigationBarTheme.copyWith(
        selectedItemColor: colorSet.white,
        unselectedItemColor: colorSet.white,
      ),
    );
  }
}
