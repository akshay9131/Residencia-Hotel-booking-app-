import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:travelapp/core/theme/colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: white,
      fontFamily: 'Overpass',
      textTheme: TextTheme(
        // For App Bar
        titleLarge: TextStyle(
            fontSize: 17.sp, fontWeight: FontWeight.w300,fontFamily: 'Overpass', color: white),
        // for hotel name & price
        titleMedium: TextStyle(
            fontSize: 13.sp, fontWeight: FontWeight.w600,fontFamily: 'Overpass', color: mainColor),
        // for Description & cityname
        titleSmall: TextStyle(
            fontSize: 11.sp, fontWeight: FontWeight.w300,fontFamily: 'Overpass', color: mainColor),
        // for rating
        displayLarge: TextStyle(
            fontSize: 10.sp, fontWeight: FontWeight.bold,fontFamily: 'Overpass', color: mainColor),
        // for headings
        displayMedium: TextStyle(
            fontSize: 16.sp, fontWeight: FontWeight.bold,fontFamily: 'Overpass', color: mainColor),
        displaySmall: TextStyle(
            fontSize: 12.sp, fontWeight: FontWeight.bold,fontFamily: 'Overpass', color: Colors.black),
      ));
}
