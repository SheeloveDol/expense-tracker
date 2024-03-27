import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Creating a light color theme for the app
var kColorTheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 47, 151, 241),
);

// Creating a dark color theme for the app
var kDarkColorTheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(233, 22, 21, 97),
);

void main() {
  runApp(
    MaterialApp(
      // Setting dark theme for the app
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorTheme,
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorTheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorTheme.primaryContainer,
            foregroundColor: kDarkColorTheme.onPrimaryContainer,
          ),
        ),
      ),

      // Setting light theme for the app
      theme: ThemeData().copyWith(
        colorScheme: kColorTheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorTheme.onPrimaryContainer,
          foregroundColor: kColorTheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorTheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorTheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColorTheme.onSecondaryContainer,
                fontSize: 16,
              ),
            ),
      ),
      home: const Expenses(),
    ),
  );
}
