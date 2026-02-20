import 'package:flutter/material.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OnboardingScreen()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/images/logo.jpg', // <-- correct path for Flutter Web
          width: 150,
          height: 150,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
