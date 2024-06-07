import 'package:flutter/material.dart';
import 'package:contact_app/screens/contact_screen.dart';

class ContactListApp extends StatelessWidget {
  const ContactListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: const ContactListScreen(),
      themeMode: ThemeMode.system,
      theme: _lightThemeData(),
      darkTheme: _darkThemeData(),
    );
  }
}

ThemeData _lightThemeData() {
  return ThemeData(
    brightness: Brightness.light,
    inputDecorationTheme: const InputDecorationTheme(
      enabledBorder:
      OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      focusedBorder:
      OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      errorBorder:
      OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
    ),
    appBarTheme:
    const AppBarTheme(color: Colors.grey, foregroundColor: Colors.white),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        fixedSize: const Size.fromWidth(double.maxFinite),
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),

    ),
    floatingActionButtonTheme:const FloatingActionButtonThemeData(backgroundColor: Colors.grey,foregroundColor: Colors.white)
    ,
  );
}

ThemeData _darkThemeData() {
  return ThemeData(
    brightness: Brightness.dark,
    inputDecorationTheme: const InputDecorationTheme(
      enabledBorder:
      OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      focusedBorder:
      OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      errorBorder:
      OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
    ),
    appBarTheme:
    const AppBarTheme(color: Colors.grey, foregroundColor: Colors.white),
  );
}