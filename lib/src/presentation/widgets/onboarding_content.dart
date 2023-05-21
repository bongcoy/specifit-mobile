import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    required this.title,
    required this.image,
    required this.desc,
  });

  final String title;
  final String image;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 120,
        ),
        Image.asset(
          image,
          height: 280,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: GoogleFonts.openSans(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          desc,
          textAlign: TextAlign.left,
          style: GoogleFonts.openSans(
            color: const Color.fromARGB(255, 107, 107, 107),
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
