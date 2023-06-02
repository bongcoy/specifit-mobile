import 'package:flutter/material.dart';
import 'package:specifit/src/presentation/themes.dart';
import 'package:specifit/src/presentation/widgets/buttons/filter_button.dart';
import 'package:specifit/src/presentation/widgets/cards/workout_card.dart';
import 'package:specifit/src/presentation/widgets/search_box.dart';

class WorkoutAllScreen extends StatelessWidget {
  const WorkoutAllScreen({Key? key}) : super(key: key);

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
            SearchBox(),
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
                              const FilterButton(),
                              const Text("Kategori"),
                              const FilterButton(),
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
                  const FilterButton(),
                ],
              ),
            ),
            const Text("Olahraga"),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (ctx, idx) {
                  return const WorkoutCard(
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
