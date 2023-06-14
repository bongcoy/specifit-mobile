import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:specifit/src/domain/models/userdata.dart';
import 'package:specifit/src/presentation/providers/auth_provider.dart';
import 'package:specifit/src/presentation/screens/tips/tips_screen.dart';
import 'package:specifit/src/presentation/widgets/cards/tips_card.dart';

import 'package:specifit/src/presentation/widgets/category_button.dart';
import 'package:specifit/src/presentation/widgets/cards/form_card.dart';
import 'package:specifit/src/presentation/providers/userdata_provider.dart';
import 'package:specifit/src/presentation/widgets/recommendation_section.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../widgets/cards/recommendation_card.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool _isDataFetched = false;
  bool isLoading = true;

  dynamic tips;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isDataFetched) {
      // getUserData();
      _isDataFetched = true;
    }
    _getTipsData();
  }

  Future<void> getUserData() async {
    final currentAuthData = ref.watch(userAuthProvider);
    final userDataNotifier = ref.read(userDataProvider.notifier);
    final headers = {'Authorization': 'Bearer ${currentAuthData.token}'};

    try {
      final response = await http.get(
        Uri.parse('https://specifit.duckdns.org/api/userdata'),
        headers: headers,
      );
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final userData = UserData.fromJson(jsonData);
        userDataNotifier.updateUserData(userData);
      } else {
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

  Future _getTipsData() async {
    final authProvider = ref.read(userAuthProvider);
    try {
      http.Response res = await http
          .get(Uri.parse("${dotenv.env['API_URL']!}tips"), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authProvider.token}',
      });
      if (res.statusCode == 200) {
        tips = json.decode(res.body);
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
    final currentUserData = ref.watch(userDataProvider);
    Widget statusCard = currentUserData.isFilled
        ? const RecommendationSection()
        : const FormCard();

    // DEBUG
    debugPrint(currentUserData.toString()); // TODO: Filters based on UserData

    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Stack(
              children: [
                Image.asset("assets/images/element_home.png"),
                Positioned(
                  left: 24,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: Text(
                      "Selamat Datang",
                      style: GoogleFonts.openSans(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            statusCard,
            currentUserData.isFilled
                ? const RecommendationCard()
                : const SizedBox(
                    height: 0,
                  ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pilih dari Kategori',
                      style: GoogleFonts.openSans(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CategoryButton(
                            icon: Icons.accessibility,
                            label: "Legs",
                          ),
                          CategoryButton(
                            icon: Icons.fitness_center,
                            label: "Arms",
                          ),
                          CategoryButton(
                            icon: Icons.shield,
                            label: "Abs",
                          ),
                          CategoryButton(
                            icon: Icons.self_improvement,
                            label: "Chest",
                          ),
                          CategoryButton(
                            icon: Icons.arrow_back,
                            label: "Back",
                          ),
                          CategoryButton(
                            icon: Icons.directions_run,
                            label: "Cardio",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Program Olahraga Saya',
                      style: GoogleFonts.openSans(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // bagian TIPS
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tips untuk Kamu',
                      style: GoogleFonts.openSans(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => const TipsScreen(),
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
            ),
            const SizedBox(height: 8),
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
                      child: isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : ListView.builder(
                              itemCount: tips['data']['total'],
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (ctx, idx) {
                                return TipsCard(
                                  titleTips: tips['data']['data'][idx]['title'],
                                  imageUrl: tips['data']['data'][idx]['img'],
                                );
                              },
                            ),
                    ),
                  ),
                ],
              ),
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     children: [
              //       Stack(
              //         children: [
              //           Container(
              //             margin: const EdgeInsets.all(16),
              //             child: Container(
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(12),
              //               ),
              //               height: 200,
              //               width: 300,
              //               child: ClipRRect(
              //                 borderRadius: BorderRadius.circular(12),
              //                 child: Image.asset(
              //                   "assets/images/program_1.png",
              //                   fit: BoxFit.cover,
              //                 ),
              //               ),
              //             ),
              //           ),
              //           Positioned(
              //             bottom: 15,
              //             left: 15,
              //             right: 15,
              //             child: Container(
              //               padding: EdgeInsets.symmetric(vertical: 8),
              //               decoration: BoxDecoration(
              //                 color: Colors.white,
              //                 borderRadius: BorderRadius.only(
              //                   bottomLeft: Radius.circular(12),
              //                   bottomRight: Radius.circular(12),
              //                 ),
              //               ),
              //               child: Text(
              //                 "Kapan Waktu yang tepat untuk berolahraga",
              //                 style: TextStyle(
              //                   fontSize: 14,
              //                   fontWeight: FontWeight.bold,
              //                   color: Colors.black,
              //                 ),
              //                 textAlign: TextAlign.start,
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
