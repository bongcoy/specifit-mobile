import 'package:flutter/material.dart';
import 'package:specifit/src/presentation/widgets/buttons/day_button.dart';
import 'package:specifit/src/presentation/widgets/cards/workout_program_detail_item.dart';

class ScheduleTabView extends StatelessWidget {
  const ScheduleTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 56,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (ctx, idx) {
                      return DayButton(
                        nDay: (idx + 1).toString(),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text("Olahraga"),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.22,
                  child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (ctx, idx) {
                      return const WorkoutProgramDetailItem();
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Center(
            child: Image.asset("assets/images/banner_meal_plan.png"),
          ),
        ],
      ),
    );
  }
}
