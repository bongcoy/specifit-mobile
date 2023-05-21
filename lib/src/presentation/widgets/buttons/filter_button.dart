import 'package:flutter/material.dart';
import 'package:specifit/src/presentation/themes.dart';

enum ExerciseFilter { arbs, arms, legs, shoulders }

class FilterButton extends StatefulWidget {
  const FilterButton({Key? key}) : super(key: key);

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  Set<ExerciseFilter> filters = <ExerciseFilter>{};

  @override
  Widget build(BuildContext context) {
    // final TextTheme textTheme = Theme.of(context).textTheme;

    return Center(
      child: Wrap(
        spacing: 5.0,
        children: ExerciseFilter.values.map((ExerciseFilter exercise) {
          return FilterChip(
            backgroundColor: Colors.white,
            selectedColor: orangeColor,
            label: Text(exercise.name),
            selected: filters.contains(exercise),
            onSelected: (bool selected) {
              setState(() {
                if (selected) {
                  filters.add(exercise);
                } else {
                  filters.remove(exercise);
                }
              });
            },
          );
        }).toList(),
      ),
    );
  }
}
