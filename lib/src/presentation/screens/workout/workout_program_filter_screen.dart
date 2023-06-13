import 'package:flutter/material.dart';

import '../../widgets/buttons/filter_button.dart';
import '../../widgets/buttons/medical_condition_checkbox.dart';

class WorkoutPorgramFilterScreen extends StatefulWidget {
  const WorkoutPorgramFilterScreen({Key? key}) : super(key: key);

  @override
  State<WorkoutPorgramFilterScreen> createState() => _WorkoutPorgramFilterScreenState();
}

class _WorkoutPorgramFilterScreenState extends State<WorkoutPorgramFilterScreen> {

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
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Action when back button is pressed
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Filter Program',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 100.0),
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
                  child: const Text(
                    'Reset Filter',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.orange,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Goals',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
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
            const SizedBox(height: 10.0),
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
            const SizedBox(height: 10.0),
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
            const SizedBox(height: 10.0),
            const Text(
              'Status Index Massa Tubuh',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 10.0),
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
            const SizedBox(height: 10.0),
            const Text(
              'Ratings',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 8.0),
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
            const SizedBox(height: 8.0),
            Row(
              children: [
                const Text(
                  'Punya Kondisi Medis',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
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
            const SizedBox(height: 8.0),
            const Text(
              'Lainnya',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 8.0),
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
            const Text(
              'Waktu',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 8.0),
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
                    child: const Text(
                      'Simpan Filter',
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

