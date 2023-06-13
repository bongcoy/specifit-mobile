import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TipsCard extends StatelessWidget {
  const TipsCard({super.key});
  final String imageUrl = "assets/images/program_1.png";

  @override
  Widget build(BuildContext context) {
    const String titleTips = "Kapan Waktu yang tepat buat olahraga";
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => WorkoutProgramDetailScreen(
        //       titleProgram: titleProgram,
        //       imageUrl: imageUrl,
        //     ),
        //   ),
        // );
      },
      child: Card(
        elevation: 4,
        color: Colors.white,
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.all(16),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: 200,
                    width: 300,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        "assets/images/program_1.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: 15,
                  right: 15,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Kapan Waktu yang tepat untuk berolahraga",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
