import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:specifit/src/presentation/screens/login_screen.dart';

import 'package:specifit/src/presentation/widgets/onboarding_content.dart';
import 'package:specifit/src/data/onboarding_data.dart';
import 'package:specifit/src/presentation/widgets/onboarding_dot.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;

  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: onboarding_data.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => OnboardingContent(
                    title: onboarding_data[index].title,
                    image: onboarding_data[index].image,
                    desc: onboarding_data[index].desc,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [
                    ...List.generate(
                      onboarding_data.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: OnboardingDot(
                          isActive: index == _pageIndex,
                        ),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: _pageIndex == 0 ? 70 : 120,
                      height: 35,
                      child: _pageIndex == 0
                          ? TextButton(
                              onPressed: () => {
                                _pageController.nextPage(
                                  curve: Curves.ease,
                                  duration: const Duration(milliseconds: 300),
                                ),
                              },
                              child: Text(
                                "Lanjut",
                                style: GoogleFonts.openSans(
                                  color:
                                      const Color.fromARGB(255, 247, 125, 11),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          : ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (ctx) => const LoginScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 247, 125, 11),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              child: Text(
                                'Mulai',
                                style: GoogleFonts.openSans(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
