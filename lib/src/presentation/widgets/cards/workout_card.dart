import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WorkoutCard extends StatelessWidget {
  // final Workout workout;
  const WorkoutCard({
    super.key,
    // required this.workout,
  });

  @override
  Widget build(BuildContext context) {
    const String title = "Biceps by Rapli";
    const String imageUrl = "assets/images/workout_2.png";
    const String desc = "Biceps";
    const String time = "15";
    const String nWorkout = "4";
    return Card(
      elevation: 4,
      color: Colors.white,
      surfaceTintColor: Colors.white,
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.20,
              height: MediaQuery.of(context).size.width * 0.20,
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(title),
                    Text(desc),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Wrap(
                  direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 8,
                  children: [
                    const Icon(
                      Icons.watch_later_outlined,
                      color: Colors.black,
                    ),
                    const Text("$time Menit"),
                    SvgPicture.asset("assets/vectors/ellipse105.svg"),
                    const Text("$nWorkout olahraga"),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
