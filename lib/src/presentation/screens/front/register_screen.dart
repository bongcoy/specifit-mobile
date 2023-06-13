import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:specifit/src/presentation/screens/front/login_screen.dart';
import 'package:specifit/src/presentation/widgets/bottom_navbar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:specifit/src/presentation/providers/auth_provider.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!EmailValidator.validate(value)) {
      return 'Invalid email format';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  Future<void> _register() async {
    final authProvider = ref.read(userAuthProvider.notifier);

    if (_formKey.currentState?.validate() ?? false) {
      final name = _nameController.text.trim();
      final email = _emailController.text.trim();
      final phone = _phoneController.text.trim();
      final password = _passwordController.text.trim();

      final url = Uri.parse('https://specifit.duckdns.org/api/register');

      try {
        final response = await http.post(
          url,
          body: {
            'name': name,
            'email': email,
            'phone': phone,
            'password': password,
          },
        );

        if (response.statusCode == 200) {
          final jsonData = json.decode(response.body);
          String token = jsonData['data']['token'];

          authProvider.login(token);

          if (context.mounted) {
            _navigateToHome(context);
          }
        } else {
          if (context.mounted) {
            final errorData = json.decode(response.body);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: Colors.white,
                title: Text(errorData['meta']['message']),
                content: Text(errorData['data']['error']),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          }
        }
      } catch (e) {
        debugPrint(e.toString());
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('Error'),
            content: Text('Error: $e'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }

  void _navigateToHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (ctx) => const BottomNavBar()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white70,
          child: Stack(
            children: [
              Positioned(
                top: 1,
                right: 1,
                child: Image.asset('assets/images/element_2.png'),
              ),
              Positioned(
                top: 100,
                left: 20,
                child: Image.asset(
                  'assets/icon.png',
                  width: 100,
                  height: 100,
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Daftar", style: TextStyle(fontSize: 20)),
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.man),
                            hintText: 'Nama',
                            hintStyle:
                                TextStyle(color: Color.fromARGB(120, 0, 0, 0)),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          validator: _validateName,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            hintText: 'Email',
                            hintStyle:
                                TextStyle(color: Color.fromARGB(120, 0, 0, 0)),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          validator: _validateEmail,
                        ),
                        TextFormField(
                          controller: _phoneController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            hintText: 'Telepon',
                            hintStyle:
                                TextStyle(color: Color.fromARGB(120, 0, 0, 0)),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          validator: _validatePhone,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            hintText: 'password',
                            hintStyle:
                                TextStyle(color: Color.fromARGB(148, 0, 0, 0)),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          validator: _validatePassword,
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: _register,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 247, 125, 11),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: const Text(
                            'Daftar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Sudah punya akun Specifit?',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => const LoginScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Masuk',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 243, 152, 33),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
