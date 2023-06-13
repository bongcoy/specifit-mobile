import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../screens/workout/workout_detail_screen.dart';

class WorkoutCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String desc;
  final String time;
  final String nWorkout;

  const WorkoutCard({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.desc,
    required this.time,
    required this.nWorkout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => WorkoutDetailScreen(
            titleWorkout: title,
            imageUrl: "assets/images/workout_2.png",
          ),
        ),
      ),
      child: Card(
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
                    children: [
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
                      Text("$time Menit"),
                      SvgPicture.asset("assets/vectors/ellipse105.svg"),
                      Text("$nWorkout olahraga"),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
