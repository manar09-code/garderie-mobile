import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';

void main() {
  runApp(const MaGarderieApp());
}

class MaGarderieApp extends StatelessWidget {
  const MaGarderieApp({super.key});

  @override
  Widget build(BuildContext context) {
    const seedColor = Color(0xFF5B9C84);

    return MaterialApp(
      title: 'Ma Garderie',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor,
          surface: const Color(0xFFFFFCF6),
        ),
        scaffoldBackgroundColor: const Color(0xFFFFFCF6),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
