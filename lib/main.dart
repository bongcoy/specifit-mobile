import 'package:flutter/material.dart';
import 'package:specifit/src/presentation/providers/auth_provider.dart';
import 'package:specifit/src/presentation/screens/front/onboarding_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:specifit/src/presentation/widgets/bottom_navbar.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 247, 125, 11),
  ),
  textTheme: GoogleFonts.openSansTextTheme(),
  scaffoldBackgroundColor: const Color.fromARGB(255, 249, 249, 249),
);

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserAuth = ref.watch(userAuthProvider);
    return MaterialApp(
      home: currentUserAuth.isLoggedIn
          ? const BottomNavBar()
          : const OnboardingScreen(),
      theme: theme,
      debugShowCheckedModeBanner: false,
    );
  }
}
