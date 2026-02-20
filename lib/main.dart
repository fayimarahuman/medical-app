import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MedicalApp());
}

/// Main App Widget
class MedicalApp extends StatelessWidget {
  const MedicalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MediConnect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
      ),
      // Start with SplashScreen
      home: const SplashScreen(),
    );
  }
}
