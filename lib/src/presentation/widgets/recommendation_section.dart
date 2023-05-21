import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:specifit/src/presentation/screens/form_screen.dart';

import 'package:specifit/src/presentation/widgets/status_card.dart';
import 'package:specifit/src/presentation/providers/userdata_provider.dart';

class RecommendationSection extends ConsumerWidget {
  const RecommendationSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserData = ref.watch(userDataProvider);

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      height: 280,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Status Kamu Sekarang',
                  style: GoogleFonts.openSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => FormScreen(),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.edit,
                    size: 16,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    StatusCard(
                      title: "Indeks Massa Tubuh",
                      desc: "(IMT)\n",
                      val: currentUserData.imt.toStringAsFixed(2),
                      label: currentUserData.imtStatus,
                    ),
                    StatusCard(
                      title: "Asupan Kalori per Hari",
                      desc: "Untuk mempertahan berat badan",
                      val: currentUserData.calPerDayHold.toString(),
                      label: "kkal",
                    ),
                    StatusCard(
                      title: "Asupan Kalori per Hari",
                      desc: "Untuk menurunkan berat badan (1kg/week)",
                      val: currentUserData.calPerDayLose.toString(),
                      label: "kkal",
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
