import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const ImmoFinderApp());
}

class ImmoFinderApp extends StatelessWidget {
  const ImmoFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ImmoFinder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF4B2A8B),
        scaffoldBackgroundColor: Colors.white,
        textTheme: Theme.of(context).textTheme,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4B2A8B)),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}