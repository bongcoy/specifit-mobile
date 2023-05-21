import 'package:flutter/material.dart';
import 'package:specifit/src/presentation/screens/onboarding_screen.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 247, 125, 11),
  ),
  textTheme: GoogleFonts.openSansTextTheme(),
  scaffoldBackgroundColor: const Color.fromARGB(255, 249, 249, 249),
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    home: const OnboardingScreen(),
    theme: theme,
  ));
}
