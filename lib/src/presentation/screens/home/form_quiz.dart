import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:specifit/src/domain/models/userdata.dart';
import 'package:specifit/src/presentation/providers/auth_provider.dart';

import 'package:specifit/src/presentation/widgets/bottom_navbar.dart';
import 'package:specifit/src/presentation/providers/userdata_provider.dart';

class FormQuiz extends ConsumerStatefulWidget {
  final List<String> questions;
  final List<List<String>> options;
  final List<String> labels;

  const FormQuiz({
    super.key,
    required this.questions,
    required this.options,
    required this.labels,
  });

  @override
  ConsumerState<FormQuiz> createState() => _FormQuizState();
}

class _FormQuizState extends ConsumerState<FormQuiz> {
  int currentQuestionIndex = 0;
  int selectedIndex = -1;
  bool showError = false;
  String? userInput;
  final TextEditingController textEditingController = TextEditingController();
  bool isValid = true;

  void _nextQuestion() {
    final currentUserData = ref.watch(userDataProvider);
    final userDataNotifier = ref.read(userDataProvider.notifier);

    setState(() {
      if (selectedIndex == -1 &&
          widget.options[currentQuestionIndex].isNotEmpty) {
        // User haven't choose option
        showError = true;
      } else if (selectedIndex != -1 &&
              widget.options[currentQuestionIndex].isNotEmpty ||
          textEditingController.text.isNotEmpty && isValid) {
        showError = false;

        // Update provider data here
        if (currentQuestionIndex == 0) {
          // Change gender
          final updatedUserData = currentUserData.copyWith(
            gender: selectedIndex + 1,
          );
          userDataNotifier.updateUserData(updatedUserData);
        } else if (currentQuestionIndex == 1) {
          // Change age
          final updatedUserData = currentUserData.copyWith(
            age: int.parse(userInput!),
          );
          userDataNotifier.updateUserData(updatedUserData);
        } else if (currentQuestionIndex == 2) {
          // Change height
          final updatedUserData = currentUserData.copyWith(
            height: int.parse(userInput!),
          );
          userDataNotifier.updateUserData(updatedUserData);
        } else if (currentQuestionIndex == 3) {
          // Change weight
          final updatedUserData = currentUserData.copyWith(
            weight: int.parse(userInput!),
          );
          userDataNotifier.updateUserData(updatedUserData);
        } else if (currentQuestionIndex == 4) {
          // Change activity
          final updatedUserData = currentUserData.copyWith(
            activity: selectedIndex + 1,
          );
          userDataNotifier.updateUserData(updatedUserData);
        } else if (currentQuestionIndex == 5) {
          // Change medicalCondition
          final updatedUserData = currentUserData.copyWith(
            medicalCondition: selectedIndex + 1,
            isFilled: true,
          );
          userDataNotifier.updateUserData(updatedUserData);
        }

        if (currentQuestionIndex < widget.questions.length - 1) {
          currentQuestionIndex++;
          selectedIndex = -1; // Reset selected index for the next question
          textEditingController.clear(); // Reset text input
        } else {
          debugPrint(currentUserData.toString()); // DEBUG

          // Calculation Here
          userDataNotifier.calculateIMT();
          userDataNotifier.calculateCalPerDay();
          userDataNotifier.calculateRecommendation();

          // POST
          postUserData(currentUserData);

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BottomNavBar()),
          );
        }
      } else {
        // Invalid input, do not proceed
        showError = true;
      }
    });
  }

  Future<void> postUserData(UserData userdata) async {
    final currentAuthData = ref.watch(userAuthProvider);
    final headers = {
      'Authorization': 'Bearer ${currentAuthData.token}',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    final body = jsonEncode({
      'activity': userdata.activity,
      'age': userdata.age,
      'calPerDayHold': userdata.calPerDayHold,
      'calPerDayLose': userdata.calPerDayLose,
      'dateOfBirth': '1988-05-20',
      'gender': userdata.gender,
      'height': userdata.height,
      'imt': userdata.imt,
      'imtStatus': userdata.imtStatus,
      'isFilled': userdata.isFilled,
      'medicalCondition': userdata.medicalCondition,
      'recommendation': userdata.recommendation.toJson(),
      'weight': userdata.weight,
    });

    try {
      final response = await http.post(
        Uri.parse('https://specifit.duckdns.org/api/userdata/edit'),
        headers: headers,
        body: body,
      );

      if (response.statusCode != 200) {
        if (context.mounted) {
          final errorData = json.decode(response.body);
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: Colors.white,
              title: Text(errorData['meta']['message']),
              content: Text(errorData['data']['error']),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
        return;
      }
    } catch (e) {
      debugPrint(e.toString());
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Error'),
          content: Text('Error: $e'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void _validateInput(String inputValue) {
    isValid = true;

    // Validation Logic
    if (currentQuestionIndex == 1) {
      int age = int.tryParse(inputValue) ?? -1;
      if (age < 5 || age > 100 || age == -1) {
        isValid = false;
      }
    } else if (currentQuestionIndex == 2) {
      int height = int.tryParse(inputValue) ?? -1;
      if (height < 100 || height > 250 || height == -1) {
        isValid = false;
      }
    } else if (currentQuestionIndex == 3) {
      int weight = int.tryParse(inputValue) ?? -1;
      if (weight < 30 || weight > 300 || weight == -1) {
        isValid = false;
      }
    }

    setState(() {
      if (isValid) {
        showError = false;
        userInput = inputValue;
      } else {
        showError = true;
      }
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String currentQuestion = widget.questions[currentQuestionIndex];
    List<String> currentOptions = widget.options[currentQuestionIndex];

    final progressPercentage =
        (currentQuestionIndex + 1) / widget.questions.length;
    final progressText =
        'Halaman ${currentQuestionIndex + 1} dari ${widget.questions.length}';

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 249, 249, 249),
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                currentQuestion,
                style: GoogleFonts.openSans(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              if (currentOptions.isEmpty)
                Container(
                  width: 170,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: textEditingController,
                          decoration: InputDecoration(
                            hintText: 'Enter your answer',
                            errorText: showError ? 'Invalid input' : null,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                          ),
                          style: const TextStyle(fontSize: 16),
                          onChanged: (value) {
                            _validateInput(value);
                          },
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        widget.labels[currentQuestionIndex],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                )
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: List.generate(currentOptions.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                          userInput = currentOptions[index];
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedIndex == index
                                ? Colors.orange
                                : const Color.fromARGB(255, 169, 168, 168),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(16.0),
                        margin: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          currentOptions[index],
                          style: GoogleFonts.openSans(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 89, 88, 88),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }),
                ),
              const SizedBox(
                height: 16,
              ),
              Visibility(
                visible: showError,
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    'Input invalid, silahkan pilih opsi atau isi field dengan benar',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: ElevatedButton(
                  onPressed: _nextQuestion,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 155, 5),
                    minimumSize: const Size(60, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                height: 14.0,
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(8.0), // Set the border radius here
                  child: LinearProgressIndicator(
                    value: progressPercentage,
                    backgroundColor: Colors.grey[200],
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.orange),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Text(
                  progressText,
                  style: GoogleFonts.openSans(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
