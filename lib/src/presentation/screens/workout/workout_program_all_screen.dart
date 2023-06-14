import 'package:flutter/material.dart';
import 'package:specifit/src/presentation/widgets/cards/workout_program_item_card.dart';

import '../../themes.dart';

class WorkoutProgramAllScreen extends StatelessWidget {
  const WorkoutProgramAllScreen({Key? key}) : super(key: key);

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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Filter Program"),
                                  TextButton(
                                    onPressed: () {
                                      // Reset Filter
                                    },
                                    child: const Text("Reset Filter"),
                                  )
                                ],
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Goals"),
                                      // const FilterButton(),
                                      const Text("Status Indeks Massa Tubuh"),
                                      // const FilterButton(),
                                      const Text("Punya Kondisi Medis"),
                                      const Text("Lainnya"),
                                      // const FilterButton(),
                                      const Text("Waktu"),
                                      // const FilterButton(),
                                      Center(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            // save filter
                                          },
                                          child: const Text("Simpan Filter"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
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
                itemCount: 3,
                itemBuilder: (ctx, idx) {
                  return const WorkoutProgramItemCard(
                      // workout: workoutList[idx],
                      );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
