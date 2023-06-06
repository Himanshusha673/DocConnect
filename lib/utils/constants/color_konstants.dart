import 'package:flutter/material.dart';

class ColorKonstants {
  static const int _primaryValue = 0xFF007BC7;
  static const Color primaryColor = Color(_primaryValue);

  static const MaterialColor primarySwatch = MaterialColor(
    _primaryValue,
    <int, Color>{
      50: Color(0xFFE1F4FE),
      100: Color(0xFFB3E2FC),
      200: Color(0xFF80C9F9),
      300: Color(0xFF4DAFF6),
      400: Color(0xFF2699F4),
      500: Color(_primaryValue),
      600: Color(0xFF006DB3),
      700: Color(0xFF005E9D),
      800: Color(0xFF004F87),
      900: Color(0xFF003B5C),
    },
  );
// my Jatya
  static const Color blueccolor = Color(0xFF009EFF);

  //onBoarding
  static const Color onBoardingBackgroudColor = Color(0xFFF8FAFB);

  static const Color textcolor = Color(0xFF414141);
  static const Color textgrey = Color(0xFFA6B1C2);

  //doctor Card
  static Color headingTextColor = const Color(0xFF3C4043);
  static Color subHeadingTextColor = const Color(0xff3c4043);
  static Color cardBackgroundColor = const Color(0xffF5FAFD);

  //verified badge
  static Color verifiedBG = const Color(0xFFDCEDF7);
  static Color verifiedBorder = const Color(0xFF007BC7);

  //doctordetailpopup
  static Color greyBG = const Color(0xFFF8F8F8);
  static Color whiteBG = const Color(0xFFFFFFFF);

  //widget colors
  static Color grey = Colors.grey.shade300;

  static Color errorColor = Colors.red.shade400;

  //paymentScreen

  static Color greybgColor = const Color.fromARGB(255, 245, 244, 244);

  //mediline
  static Color cardBackGround = const Color(0xffF5FAFD);

  //my jatya
  static Color tileBackGround = const Color.fromARGB(255, 237, 244, 248);
  static Color tileBorderBackGround = const Color.fromARGB(255, 7, 7, 7);

// prescription ui
  static Color clinicOnwerTag = const Color(0xff45A4B7);
  static Color bloodpressureBG = const Color(0xffFFFBF0);
  static Color bloodpressureBG2 = const Color(0xffF4F6FF);
  static Color bloodpressureBG3 = const Color(0xffFFF7F8);
}
