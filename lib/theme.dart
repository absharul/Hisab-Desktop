import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  primarySwatch: Colors.blue,
  useMaterial3: true,
  fontFamily: 'Inter',
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.white,
    ),
    titleTextStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    color: Colors.teal,
    centerTitle: true,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
    ),
  ),
  tabBarTheme: const TabBarTheme(
      dividerColor: Colors.grey,
      dividerHeight: 3,
      indicatorColor: Colors.teal,
      unselectedLabelColor: Colors.grey,
      labelColor: Colors.teal,
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      )),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.teal,
    iconSize: 18,
  ),
);
