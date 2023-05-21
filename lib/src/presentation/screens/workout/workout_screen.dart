import 'package:flutter/material.dart';
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
          child: Column(
            children: [
              Container(
                width: 360,
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
                      padding: EdgeInsetsDirectional.fromSTEB(18, 69, 231, 50),
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
                      onPressed: () {},
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 50,
                        height: 4,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F4F8),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      ListView(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: const [
                          WorkoutCard(),
                          WorkoutCard(),
                          WorkoutCard(),
                        ],
                      ),
                    ],
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
