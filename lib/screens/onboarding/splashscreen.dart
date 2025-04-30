//splashscreen.dart

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Center(
          child: Text(
            'Zehmet.az',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Roboto Slab',
              fontSize: 60,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              letterSpacing: 0.0,
            ),
          ),
        ),
      ),
    );
  }
}