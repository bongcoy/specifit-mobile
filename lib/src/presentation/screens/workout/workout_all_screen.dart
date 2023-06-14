import 'package:flutter/material.dart';
import 'package:specifit/src/presentation/themes.dart';
import 'package:specifit/src/presentation/widgets/cards/workout_card.dart';

class WorkoutAllScreen extends StatelessWidget {
  final dynamic workouts;
  const WorkoutAllScreen({Key? key, required this.workouts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundScreenColor,
        iconTheme: const IconThemeData(color: grey3Color),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SearchBox(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: backgroundScreenColor,
                        builder: (ctx) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Filter Olahraga"),
                              const Text("Kategori"),
                              // const FilterButton(),
                              const Text("Waktu"),
                              // const FilterButton(),
                              ElevatedButton(
                                onPressed: () {
                                  // save filter
                                },
                                child: const Text("Simpan Filter"),
                              )
                            ],
                          );
                        },
                      );
                    },
                    child: const Text("Filter"),
                  ),
                  // const FilterButton(),
                ],
              ),
            ),
            const Text("Olahraga"),
            Expanded(
              child: ListView.builder(
                itemCount: workouts['data']['total'],
                itemBuilder: (ctx, idx) {
                  return WorkoutCard(
                      title: workouts['data']['data'][idx]['title'].toString(),
                      imageUrl: workouts['data']['data'][idx]['img'].toString(),
                      desc: workouts['data']['data'][idx]['desc'].toString(),
                      time:
                          workouts['data']['data'][idx]['totalEst'].toString(),
                      nWorkout: workouts['data']['data'][idx]['workoutLists']
                          .length
                          .toString(),
                      workoutList: workouts['data']['data'][idx]
                          ['workoutLists'],
                      workoutTimeList: workouts['data']['data'][idx]
                          ['workoutEsts']);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
