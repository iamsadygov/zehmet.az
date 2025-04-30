//         ███████╗ █████╗ ██████╗ ██╗   ██╗ ██████╗  ██████╗ ██╗   ██╗
//         ██╔════╝██╔══██╗██╔══██╗╚██╗ ██╔╝██╔════╝ ██╔═══██╗██║   ██║
//         ███████╗███████║██║  ██║ ╚████╔╝ ██║  ███╗██║   ██║██║   ██║
//         ╚════██║██╔══██║██║  ██║  ╚██╔╝  ██║   ██║██║   ██║╚██╗ ██╔╝
//         ███████║██║  ██║██████╔╝   ██║   ╚██████╔╝╚██████╔╝ ╚████╔╝
//         ╚══════╝╚═╝  ╚═╝╚═════╝    ╚═╝    ╚═════╝  ╚═════╝   ╚═══╝

import 'package:flutter/material.dart';
import 'screens/onboarding/splashscreen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/onboarding/signup_screen.dart';
import 'screens/auth/otp_screen.dart';
import 'screens/home/cl_home_screen.dart';
import 'widgets/main_scaffold.dart';
import 'screens/profile/edit_profile_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zehmet.az',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        primaryColor: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/otp': (context) => const OTPScreen(),
        '/home': (context) => const MainScaffold(),
        '/editProfile': (context) => const EditProfileScreen(),
      },
    );
  }
}