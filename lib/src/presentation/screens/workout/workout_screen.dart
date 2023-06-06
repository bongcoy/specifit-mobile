import 'package:flutter/material.dart';
import 'package:specifit/src/presentation/screens/workout/workout_all_screen.dart';
import 'package:specifit/src/presentation/screens/workout/workout_program_all_screen.dart';
import 'package:specifit/src/presentation/widgets/cards/workout_program_item_card.dart';
import 'package:specifit/src/presentation/widgets/search_box.dart';

import '../../widgets/cards/workout_card.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // return GestureDetector(
    return SafeArea(
      // onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        // key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 152,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFF810D),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-1.1, 1.79),
                        child: Image.asset(
                          'assets/images/element_workout_2.png',
                          width: 91,
                          height: 92,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            142.5, 41.21, 0, 1.14),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/element_workout_header.png',
                            width: 255,
                            height: 111.93,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(18, 69, 231, 50),
                        child: Text(
                          'Olahraga',
                          style: TextStyle(
                            fontFamily: 'Open Sans',
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SearchBox(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Olahraga',
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontSize: 16,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => const WorkoutAllScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Lihat Semua',
                          style: TextStyle(
                            fontFamily: 'Open Sans',
                            color: Color(0xFFFF810D),
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: 50,
                        height: 4,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F4F8),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.28,
                        child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (ctx, idx) {
                            return const WorkoutCard();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Program Olahraga >7 hari',
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontSize: 16,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => const WorkoutProgramAllScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Lihat Semua',
                          style: TextStyle(
                            fontFamily: 'Open Sans',
                            color: Color(0xFFFF810D),
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: 50,
                        height: 4,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F4F8),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.32,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            itemCount: 3,
                            itemBuilder: (ctx, idx) {
                              return const WorkoutProgramItemCard();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
