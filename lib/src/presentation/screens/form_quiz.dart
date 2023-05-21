import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:specifit/src/presentation/screens/home_screen.dart';

class FormQuiz extends StatefulWidget {
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
  _FormQuizState createState() => _FormQuizState();
}

class _FormQuizState extends State<FormQuiz> {
  int currentQuestionIndex = 0;
  int selectedIndex = -1;
  bool showError = false;
  String? userInput;
  final TextEditingController textEditingController = TextEditingController();
  bool isValid = true;

  void _nextQuestion() {
    setState(() {
      if (selectedIndex == -1 &&
          widget.options[currentQuestionIndex].isNotEmpty) {
        // User haven't choose option
        showError = true;
      } else if (selectedIndex != -1 &&
              widget.options[currentQuestionIndex].isNotEmpty ||
          textEditingController.text.isNotEmpty && isValid) {
        showError = false;

        if (currentQuestionIndex < widget.questions.length - 1) {
          currentQuestionIndex++;
          selectedIndex = -1; // Reset selected index for the next question
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        }
      } else {
        // Invalid input, do not proceed
        showError = true;
      }
    });
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
      int weight = int.tryParse(inputValue) ?? -1;
      if (weight < 30 || weight > 300 || weight == -1) {
        isValid = false;
      }
    } else if (currentQuestionIndex == 3) {
      int height = int.tryParse(inputValue) ?? -1;
      if (height < 100 || height > 250 || height == -1) {
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

    return Scaffold(
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
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        widget.labels[currentQuestionIndex],
                        style: TextStyle(fontSize: 16),
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
                                : Color.fromARGB(255, 169, 168, 168),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(16.0),
                        margin: EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          currentOptions[index],
                          style: GoogleFonts.openSans(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 89, 88, 88),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }),
                ),
              const Spacer(),
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
              Padding(
                padding: const EdgeInsets.only(bottom: 100),
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
            ],
          ),
        ),
      ),
    );
  }
}
