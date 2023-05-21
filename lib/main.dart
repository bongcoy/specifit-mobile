import 'package:flutter/material.dart';
import 'package:specifit/src/presentation/screens/onboarding_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const OnboardingScreen(),
      theme: theme,
    );
  }
}
