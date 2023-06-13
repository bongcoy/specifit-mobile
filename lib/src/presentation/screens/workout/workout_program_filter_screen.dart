import 'package:flutter/material.dart';

class WorkoutProgramFilterScreen extends StatefulWidget {
  List<String> selectedGoals = [];
  List<String> selectedStatus = [];
  List<String> selectedRatings = [];
  List<String> selectedMedicals = [];
  List<String> selectedOthers = [];
  List<String> selectedTimes = [];

  void selectGoal(String goal) {
    setState(() {
      if (selectedGoals.contains(goal)) {
        selectedGoals.remove(goal);
      } else {
        selectedGoals.add(goal);
      }
    });
  }

  void selectStatus(String status) {
    setState(() {
      if (selectedStatus.contains(status)) {
        selectedStatus.remove(status);
      } else {
        selectedStatus.add(status);
      }
    });
  }

  void selectRating(String rating) {
    setState(() {
      if (selectedRatings.contains(rating)) {
        selectedRatings.remove(rating);
      } else {
        selectedRatings.add(rating);
      }
    });
  }

  void selectMedical(String medical) {
    setState(() {
      if (selectedMedicals.contains(medical)) {
        selectedMedicals.remove(medical);
      } else {
        selectedMedicals.add(medical);
      }
    });
  }

  void selectOther(String other) {
    setState(() {
      if (selectedOthers.contains(other)) {
        selectedOthers.remove(other);
      } else {
        selectedOthers.add(other);
      }
    });
  }

  void selectTime(String time) {
    setState(() {
      if (selectedTimes.contains(time)) {
        selectedTimes.remove(time);
      } else {
        selectedTimes.add(time);
      }
    });
  }

  void resetFilter() {
    setState(() {
      selectedGoals.clear();
      selectedStatus.clear();
      selectedRatings.clear();
      selectedMedicals.clear();
      selectedOthers.clear();
      selectedTimes.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.grey,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Action when back button is pressed
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Filter Program',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 100.0),
                TextButton(
                  onPressed: () {
                    setState(() {
                      selectedGoals.clear();
                      selectedStatus.clear();
                      selectedRatings.clear();
                      selectedMedicals.clear();
                      selectedOthers.clear();
                      selectedTimes.clear();
                    });
                  },
                  child: Text(
                    'Reset Filter',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.orange,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Text(
              'Goals',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Wrap(
              spacing: 10.0,
              children: [
                FilterButton(
                  label: 'Lose Weight',
                  onPressed: () => selectGoal('Lose Weight'),
                  selected: selectedGoals.contains('Lose Weight'),
                ),
                FilterButton(
                  label: 'Gain Weight',
                  onPressed: () => selectGoal('Gain Weight'),
                  selected: selectedGoals.contains('Gain Weight'),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Wrap(
              spacing: 10.0,
              children: [
                FilterButton(
                  label: 'Agility',
                  onPressed: () => selectGoal('Agility'),
                  selected: selectedGoals.contains('Agility'),
                ),
                FilterButton(
                  label: 'Fat Burning',
                  onPressed: () => selectGoal('Fat Burning'),
                  selected: selectedGoals.contains('Fat Burning'),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Wrap(
              spacing: 10.0,
              children: [
                FilterButton(
                  label: 'Strength Training',
                  onPressed: () => selectGoal('Strength Training'),
                  selected: selectedGoals.contains('Strength Training'),
                ),
                FilterButton(
                  label: 'Calisthenics',
                  onPressed: () => selectGoal('Calisthenics'),
                  selected: selectedGoals.contains('Calisthenics'),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Text(
              'Status Index Massa Tubuh',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 10.0),
            Wrap(
              spacing: 10.0,
              children: [
                FilterButton(
                  label: 'Gemuk',
                  onPressed: () => selectStatus('Gemuk'),
                  selected: selectedStatus.contains('Gemuk'),
                ),
                FilterButton(
                  label: 'Normal',
                  onPressed: () => selectStatus('Normal'),
                  selected: selectedStatus.contains('Normal'),
                ),
                FilterButton(
                  label: 'Kurus',
                  onPressed: () => selectStatus('Kurus'),
                  selected: selectedStatus.contains('Kurus'),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Text(
              'Ratings',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 8.0),
            Wrap(
              spacing: 8.0,
              children: [
                FilterButton(
                  label: '3 Keatas',
                  onPressed: () => selectRating('3 Keatas'),
                  selected: selectedRatings.contains('3 Keatas'),
                ),
                FilterButton(
                  label: '4 Keatas',
                  onPressed: () => selectRating('4 Keatas'),
                  selected: selectedRatings.contains('4 Keatas'),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Text(
                  'Punya Kondisi Medis',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                    width:
                        175.0), // Menambahkan jarak horizontal antara teks dan checkbox
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Wrap(
                      spacing: 16.0,
                      children: [
                        MedicalConditionCheckbox(
                          label: '',
                          value: selectedMedicals.contains(''),
                          onChanged: (value) => selectMedical(''),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 4.0),
            SizedBox(height: 4.0),
            Text(
              'Lainnya',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 8.0),
            Wrap(
              spacing: 8.0,
              children: [
                FilterButton(
                  label: 'Butuh Peralatan',
                  onPressed: () => selectOther('Butuh Peralatan'),
                  selected: selectedOthers.contains('Butuh Peralatan'),
                ),
                FilterButton(
                  label: 'Recommended',
                  onPressed: () => selectOther('Recommended'),
                  selected: selectedOthers.contains('Recommended'),
                ),
              ],
            ),
            Text(
              'Waktu',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 8.0),
            Wrap(
              spacing: 8.0,
              children: [
                FilterButton(
                  label: '7 Hari',
                  onPressed: () => selectTime('7 Hari'),
                  selected: selectedTimes.contains('7 Hari'),
                ),
                FilterButton(
                  label: '14 Hari',
                  onPressed: () => selectTime('14 Hari'),
                  selected: selectedTimes.contains('14 Hari'),
                ),
                FilterButton(
                  label: '>14 Hari',
                  onPressed: () => selectTime('>14 Hari'),
                  selected: selectedTimes.contains('>14 Hari'),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.orange,
                      ),
                    ),
                    child: Text(
                      'Simpan Filter',
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool selected;

  const FilterButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.orange;
          }
          return selected ? Colors.orange : Colors.grey;
        }),
      ),
      child: Text(label, style: TextStyle(fontSize: 18.0)),
    );
  }
}

class MedicalConditionCheckbox extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const MedicalConditionCheckbox({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
        ),
        Text(label),
      ],
    );
  }
}
