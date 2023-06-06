import 'package:flutter/material.dart';
import 'package:jatya_patient_mobile/utils/constants/color_konstants.dart';

class ThemeConstants {
  static ThemeData mainTheme = ThemeData(
    primarySwatch: ColorKonstants.primarySwatch,
    colorScheme: ColorScheme.fromSeed(seedColor: ColorKonstants.primarySwatch),
    fontFamily: 'Proxima Nova',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: 0,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: 0,
      ),
    ),
    dividerTheme: const DividerThemeData(
      indent: 16,
      endIndent: 16,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
    ),
    iconTheme: const IconThemeData(color: ColorKonstants.primaryColor),
    listTileTheme: const ListTileThemeData(),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorKonstants.primaryColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(color: Colors.black),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),
    ),
    // textTheme: proximaNovaTheme,
    tabBarTheme: const TabBarTheme(
        unselectedLabelColor: Colors.grey,
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w400,
        ),
        labelColor: ColorKonstants.primaryColor,
        labelStyle: TextStyle(fontWeight: FontWeight.w400)),
  );

  static TextTheme proximaNovaTheme = const TextTheme(
    bodyMedium: TextStyle(
      fontFamily: 'Proxima Nova',
      fontWeight: FontWeight.w400,
      fontSize: 13,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Proxima Nova',
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Proxima Nova',
      fontWeight: FontWeight.w400,
      fontSize: 11,
    ),
    labelLarge: TextStyle(
      fontFamily: 'Proxima Nova',
      fontWeight: FontWeight.w600,
      fontSize: 16,
    ),
    labelMedium: TextStyle(
      fontFamily: 'Proxima Nova',
      fontWeight: FontWeight.w600,
      fontSize: 14,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Proxima Nova',
      fontWeight: FontWeight.w600,
      fontSize: 12,
    ),
    headlineLarge: TextStyle(
      fontFamily: 'Proxima Nova',
      fontWeight: FontWeight.w700,
      fontSize: 16,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Proxima Nova',
      fontWeight: FontWeight.w700,
      fontSize: 14,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'Proxima Nova',
      fontWeight: FontWeight.w700,
      fontSize: 12,
    ),
    titleLarge: TextStyle(
      fontFamily: 'Proxima Nova',
      fontWeight: FontWeight.w800,
      fontSize: 20,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Proxima Nova',
      fontWeight: FontWeight.w800,
      fontSize: 18,
    ),
    titleSmall: TextStyle(
      fontFamily: 'Proxima Nova',
      fontWeight: FontWeight.w800,
      fontSize: 14,
    ),
  );

  static TextStyle proxima = const TextStyle(
    fontFamily: 'Proxima Nova',
    fontWeight: FontWeight.w400,
    fontSize: 13,
  );
}
