import 'package:flutter/material.dart';
import 'screens/startup_screen.dart';

void main() => runApp(const MenstrualHealthApp());

class MenstrualHealthApp extends StatelessWidget {
  const MenstrualHealthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eva',
      theme: ThemeData(
        primaryColor: const Color(0xFF7E57C2),
        scaffoldBackgroundColor: Colors.white,
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF7E57C2),
          secondary: Color(0xFF7E57C2),
          surface: Colors.white,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.black,
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF7E57C2)),
          headlineMedium: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.black),
          labelLarge: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF7E57C2),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 2,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xFF7E57C2), size: 24),
        cardTheme: const CardTheme(
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)))),
      ),
      home: const StartupScreen(),
    );
  }
}
