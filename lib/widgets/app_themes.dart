import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xFFFFD700);
const Color kBackgroundColor = Color(0xFF121212);
const Color kCardColor = Color(0xFF1E1E1E);
const Color kTextColor = Colors.white;

final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: kBackgroundColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: kBackgroundColor,
    foregroundColor: kTextColor,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: kTextColor,
    ),
    bodyMedium: TextStyle(color: kTextColor),
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: kPrimaryColor,
    surface: kBackgroundColor,
    surfaceContainerHighest: kCardColor,
    onSurface: kTextColor,
    onSurfaceVariant: kTextColor,
  ),
  useMaterial3: true,
);
