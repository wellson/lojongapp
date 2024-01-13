import 'package:flutter/material.dart';

abstract final class AppTheme {
  static const orange = 0xFFE09090;
  static const orange2 = 0xFFD88AA1;
  static const orange3 = 0xFFBF7964;
  static const orange4 = 0xFFDF989B;
  static const blue = 0xFF446DAF;
  static const blue2 = 0xFF8DC1E9;
  static const black = 0xFF000000;
  static const black2 = 0xFF80848F;
  static const gray = 0xFFECECEC;
  static const gray2 = 0xFFEBEBEB;
  static const white = 0xFFFFFFFF;
  static const colorOrange = Color(orange);
  static const colorOrange2 = Color(orange2);
  static const colorOrange3 = Color(orange3);
  static const colorOrange4 = Color(orange4);
  static const colorBlue = Color(blue);
  static const colorBlue2 = Color(blue2);
  static const colorBlack = Color(black);
  static const colorBlack2 = Color(black2);
  static const colorGray = Color(gray);
  static const colorGray2 = Color(gray2);
  static const colorWhite = Color(white);
  static const bodyTextStyle = TextStyle(
    fontFamily: 'Asap',
    fontSize: 14.63,
    fontWeight: FontWeight.w400,
  );
  static const bodyTextStyle2 = TextStyle(
    fontFamily: 'Asap',
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );
  static const bodyTextStyle3 = TextStyle(
    fontFamily: 'Asap',
    fontSize: 9,
    fontWeight: FontWeight.w400,
  );
  static const bodyTextStyle4 = TextStyle(
    fontFamily: 'Asap',
    fontSize: 9,
    fontWeight: FontWeight.w700,
  );
  static const titleTextStyle = TextStyle(
    fontFamily: 'Asap',
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static const titleTextStyle2 = TextStyle(
    fontFamily: 'Asap',
    fontSize: 15.77,
    fontWeight: FontWeight.w700,
  );

  static const titleTextStyle3 = TextStyle(
    fontFamily: 'Asap',
    fontSize: 13.51,
    fontWeight: FontWeight.w700,
  );
  static const titleTextStyle4 = TextStyle(
    fontFamily: 'Asap',
    fontSize: 13,
    fontWeight: FontWeight.w600,
  );
  static const titleTextStyle5 = TextStyle(
    fontFamily: 'Asap',
    fontSize: 12.27,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );
  static const titleTextStyle6 = TextStyle(
    fontFamily: 'Asap',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
  );
  static const buttonTextStyle = TextStyle(
    fontFamily: 'Asap',
    fontSize: 12.38,
    fontWeight: FontWeight.w700,
  );
  static const buttonTextStyle2 = TextStyle(
    fontFamily: 'Asap',
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );
  static final lightTheme = ThemeData(
    fontFamily: 'Asap',
    colorScheme: ColorScheme.fromSeed(
      seedColor: colorOrange,
    ),
  );
}
