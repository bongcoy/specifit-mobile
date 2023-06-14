import 'package:flutter/material.dart';
import 'package:specifit/src/presentation/widgets/buttons/day_button.dart';
import 'package:specifit/src/presentation/widgets/cards/workout_program_detail_item.dart';

class ScheduleTabView extends StatefulWidget {
  const ScheduleTabView({Key? key}) : super(key: key);

  @override
  State<ScheduleTabView> createState() => _ScheduleTabViewState();
}

class _ScheduleTabViewState extends State<ScheduleTabView> {
  final List<int> days = [1, 2, 3, 4, 5, 6, 7];

  int? selectedDay;

  void handleButtonSelected(int day) {
    selectedDay = day;
    // Perform any additional logic when a button is selected
  }

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
                  height: 32,
                  child: DayButton(
                    days: days,
                    onButtonSelected: handleButtonSelected,
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
