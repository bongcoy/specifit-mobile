import 'package:flutter/material.dart';
import 'package:specifit/src/presentation/widgets/buttons/day_button.dart';

class ScheduleTabView extends StatelessWidget {
  const ScheduleTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
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
      ],
    );
  }
}
