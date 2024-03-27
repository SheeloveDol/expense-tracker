import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Creating a main color theme for the app
var kColorTheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 47, 151, 241),
);

void main() {
  runApp(
    MaterialApp(
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
