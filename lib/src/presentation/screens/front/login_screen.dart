import 'package:flutter/material.dart';
import 'package:specifit/src/presentation/widgets/bottom_navbar.dart';
import 'register_screen.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  

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
              child: Image.asset('assets/images/element_1.png')
            ),
            Positioned(
              top: 100,
              left: 20,
              child: Image.asset(
                'assets/icon.png',
                width: 100,
                height: 100,
                )
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Login form components (e.g., TextFields, Buttons) go here
                    const Text("Masuk",style: TextStyle(fontSize: 20)),
                    const TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: 'email',
                        hintStyle: TextStyle(color: Color.fromARGB(131, 0, 0, 0)),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        hintText: 'password',
                        hintStyle: TextStyle(color: Color.fromARGB(148, 0, 0, 0)),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => const BottomNavBar(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 247, 125, 11),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                        ),
                  ),
                  ],
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
                      'Belum punya akun Specifit?',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                      builder: (ctx) => const RegisterScreen(),
                    ),
                  );
                      },
                      child: const Text(
                        'Daftar',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 243, 152, 33)),
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
