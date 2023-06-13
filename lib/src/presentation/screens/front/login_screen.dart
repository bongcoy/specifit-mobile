import 'package:flutter/material.dart';
import 'package:specifit/src/presentation/screens/front/login_form_screen.dart';
import '../../providers/auth_provider.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider = AuthProvider();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: FutureBuilder<bool>(
        future: authProvider.checkAuthStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final isAuthenticated = snapshot.data ?? false;
            return isAuthenticated ? const HomeScreen() : const LoginFormScreen();
          }
        },
      ),
    );
  }
}
