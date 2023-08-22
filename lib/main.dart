import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tic tac toe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        fontFamily: GoogleFonts.roboto().fontFamily,
        textTheme: Theme.of(context).textTheme.copyWith(
              labelLarge: TextStyle(
                fontFamily: GoogleFonts.caveatBrush().fontFamily,
                fontSize: 70,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
              labelMedium: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              titleLarge: TextStyle(
                fontFamily: GoogleFonts.caveatBrush().fontFamily,
                fontSize: 72,
              ),
            ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
