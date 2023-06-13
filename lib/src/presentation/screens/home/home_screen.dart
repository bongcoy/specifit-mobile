import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:specifit/src/presentation/screens/tips/tips_screen.dart';
import 'package:specifit/src/presentation/widgets/cards/tips_card.dart';

import 'package:specifit/src/presentation/widgets/category_button.dart';
import 'package:specifit/src/presentation/widgets/cards/form_card.dart';
import 'package:specifit/src/presentation/providers/userdata_provider.dart';
import 'package:specifit/src/presentation/widgets/recommendation_section.dart';

import '../../widgets/cards/recommendation_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserData = ref.watch(userDataProvider);
    Widget statusCard = currentUserData.isFilled
        ? const RecommendationSection()
        : const FormCard();

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
                      "Selamat Datang",
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
            // bagian TIPS
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tips untuk Kamu',
                      style: GoogleFonts.openSans(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => const TipsScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Lihat Semua',
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          color: Color(0xFFFF810D),
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: 50,
                    height: 4,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F4F8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.32,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: 2,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, idx) {
                          return const TipsCard();
                        },
                      ),
                    ),
                  ),
                ],
              ),
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     children: [
              //       Stack(
              //         children: [
              //           Container(
              //             margin: const EdgeInsets.all(16),
              //             child: Container(
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(12),
              //               ),
              //               height: 200,
              //               width: 300,
              //               child: ClipRRect(
              //                 borderRadius: BorderRadius.circular(12),
              //                 child: Image.asset(
              //                   "assets/images/program_1.png",
              //                   fit: BoxFit.cover,
              //                 ),
              //               ),
              //             ),
              //           ),
              //           Positioned(
              //             bottom: 15,
              //             left: 15,
              //             right: 15,
              //             child: Container(
              //               padding: EdgeInsets.symmetric(vertical: 8),
              //               decoration: BoxDecoration(
              //                 color: Colors.white,
              //                 borderRadius: BorderRadius.only(
              //                   bottomLeft: Radius.circular(12),
              //                   bottomRight: Radius.circular(12),
              //                 ),
              //               ),
              //               child: Text(
              //                 "Kapan Waktu yang tepat untuk berolahraga",
              //                 style: TextStyle(
              //                   fontSize: 14,
              //                   fontWeight: FontWeight.bold,
              //                   color: Colors.black,
              //                 ),
              //                 textAlign: TextAlign.start,
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
