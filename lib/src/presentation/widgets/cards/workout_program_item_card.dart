import 'package:flutter/material.dart';
import 'package:specifit/src/presentation/screens/workout/workout_program_detail_screen.dart';
import 'package:specifit/src/presentation/themes.dart';

class WorkoutProgramItemCard extends StatelessWidget {
  const WorkoutProgramItemCard({Key? key}) : super(key: key);
  final String imageUrl = "assets/images/program_1.png";

  @override
  Widget build(BuildContext context) {
    const String typeProgram = "Lose Weight";
    const String titleProgram = "Menurunkan Berat Badan";
    const String daysProgram = "7";
    const String ratingsProgram = "4.7";
    const String nRatingsProgram = "21";
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WorkoutProgramDetailScreen(
              titleProgram: titleProgram,
              imageUrl: imageUrl,
            ),
          ),
        );
      },
      child: Card(
        elevation: 4,
        color: Colors.white,
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              height: MediaQuery.of(context).size.height * 0.12,
              width: double.infinity,
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Icon(Icons.person, color: orangeColor),
                      Icon(Icons.thumb_up, color: orangeColor),
                      Text(typeProgram),
                    ],
                  ),
                  const Divider(
                    height: 1,
                  ),
                  const Text(titleProgram),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(Icons.watch_later_outlined, color: orangeColor),
                      Text("$daysProgram hari"),
                      Icon(Icons.star, color: orangeColor),
                      Text("$ratingsProgram ($nRatingsProgram)"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
