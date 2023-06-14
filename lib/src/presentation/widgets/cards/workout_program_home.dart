import 'package:flutter/material.dart';
import 'package:specifit/src/presentation/themes.dart';
import 'package:specifit/src/presentation/widgets/box/progress_widget.dart';

class WorkoutPorgramHomeCard extends StatelessWidget {
  final String title;
  final String type;
  const WorkoutPorgramHomeCard({
    Key? key,
    required this.title,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: grey1Color,
      surfaceTintColor: Colors.white,
      child: Row(
        children: [
          Image.asset(
            "assets/images/program_1.png",
            height: 160,
          ),
          const SizedBox(width: 16,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              Row(
                children: [
                  Text(type),
                ],
              ),
              // const ProgressWidget(),
            ],
          )
        ],
      ),
    );
  }
}
