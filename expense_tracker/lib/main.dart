import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

import 'package:expense_tracker/widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 238, 183, 65),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Color.fromARGB(54, 238, 183, 65),
);

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  //SystemChrome.setPreferredOrientations(
  //  [
  //    DeviceOrientation.portraitUp,
  //  ],
  //).then((fn) {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
        cardTheme: CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kDarkColorScheme.secondaryContainer,
              foregroundColor: kDarkColorScheme.onSecondaryContainer),
        ),
      ),

      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.secondaryContainer,
          foregroundColor: kColorScheme.onSecondaryContainer,
        ),
        cardTheme: CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        ),
        snackBarTheme: SnackBarThemeData().copyWith(
          actionTextColor: kColorScheme.secondaryContainer,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.secondaryContainer,
              foregroundColor: kColorScheme.onSecondaryContainer),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 16,
              ),
            ),
      ),
      //themeMode: ThemeMode.system, //default configuration
      home: const Expenses(),
    ),
  );
  //});
}
