import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:specifit/src/presentation/widgets/category_button.dart';
import 'package:specifit/src/presentation/widgets/form_card.dart';
import 'package:specifit/src/presentation/providers/userdata_provider.dart';
import 'package:specifit/src/presentation/widgets/recommendation_card.dart';
import 'package:specifit/src/presentation/widgets/recommendation_section.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserData = ref.watch(userDataProvider);
    Widget statusCard =
        currentUserData.isFilled ? const RecommendationSection() : const FormCard();

    // DEBUG
    debugPrint(currentUserData.toString()); // TODO: Filters based on UserData

    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Stack(
              children: [
                Image.asset("assets/images/element_home.png"),
                Positioned(
                  left: 24,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: Text(
                      "Halo, Name",
                      style: GoogleFonts.openSans(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            statusCard,
            currentUserData.isFilled
                ? const RecommendationCard()
                : const SizedBox(
                    height: 0,
                  ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pilih dari Kategori',
                      style: GoogleFonts.openSans(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: const [
                          CategoryButton(
                              icon: Icons.fitness_center, label: "Legs"),
                          CategoryButton(
                              icon: Icons.fitness_center, label: "Legs"),
                          CategoryButton(
                              icon: Icons.fitness_center, label: "Legs"),
                          CategoryButton(
                              icon: Icons.fitness_center, label: "Legs"),
                          CategoryButton(
                              icon: Icons.fitness_center, label: "Legs"),
                          CategoryButton(
                              icon: Icons.fitness_center, label: "Legs"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Program Olahraga Saya',
                      style: GoogleFonts.openSans(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tips untuk Kamu',
                      style: GoogleFonts.openSans(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
