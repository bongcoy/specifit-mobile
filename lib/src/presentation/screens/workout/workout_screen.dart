import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:specifit/src/presentation/screens/workout/workout_all_screen.dart';
import 'package:specifit/src/presentation/screens/workout/workout_program_all_screen.dart';
import 'package:specifit/src/presentation/widgets/cards/workout_program_item_card.dart';
import 'package:specifit/src/presentation/providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../../../domain/models/workout.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../widgets/cards/workout_card.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

dynamic workouts;

class _WorkoutScreenState extends State<WorkoutScreen> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future _getData() async {
    // final currentAuthData = ref.watch(userAuthProvider);
    try {
      await dotenv.load(fileName: ".env");
      http.Response res = await http
          .get(Uri.parse(dotenv.env['API_URL']! + "workout" ?? ""), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${dotenv.env['TOKEN']}',
      });
      if (res.statusCode == 200) {
        workouts = json.decode(res.body);
        setState(() {
          isLoading = false;
        });
      } else {
        if (context.mounted) {
          final errorData = json.decode(res.body);
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
                // SearchBox(),
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
                          isLoading
                              ? Center(child: CircularProgressIndicator())
                              : Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (ctx) => WorkoutAllScreen(
                                      workouts: workouts,
                                    ),
                                  ),
                                );
                        },
                        child: const Text(
                          'Lihat Semua',
                          style: TextStyle(
                            fontFamily: 'Open Sans',
                            color: Color(0xFFFF810D),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.28,
                  child: isLoading
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: workouts['data']['total'],
                          itemBuilder: (ctx, idx) {
                            return WorkoutCard(
                                title: workouts['data']['data'][idx]['title']
                                    .toString(),
                                imageUrl: workouts['data']['data'][idx]['img']
                                    .toString(),
                                desc: workouts['data']['data'][idx]['desc']
                                    .toString(),
                                time: workouts['data']['data'][idx]['totalEst']
                                    .toString(),
                                nWorkout: workouts['data']['data'][idx]
                                        ['workoutLists']
                                    .length
                                    .toString(),
                                workoutList: workouts['data']['data'][idx]
                                    ['workoutLists'],
                                workoutTimeList: workouts['data']['data'][idx]
                                    ['workoutEsts']);
                          },
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Program Olahraga 7 hari',
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
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
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
        ),
      ),
    );
  }
}
