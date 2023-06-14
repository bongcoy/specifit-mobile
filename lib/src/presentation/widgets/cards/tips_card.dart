import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:specifit/src/presentation/providers/auth_provider.dart';

class TipsCard extends ConsumerWidget {
  TipsCard({super.key, required this.titleTips, required this.imageUrl});
  final String imageUrl;
  final String titleTips;
  final String url = "${dotenv.env['API_URL']!}tips/image/";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentAuthData = ref.read(userAuthProvider);
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => WorkoutProgramDetailScreen(
        //       titleProgram: titleProgram,
        //       imageUrl: imageUrl,
        //     ),
        //   ),
        // );
      },
      child: Card(
        elevation: 4,
        color: Colors.white,
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.all(16),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: 200,
                    width: 300,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        url + imageUrl,
                        headers: {
                          'Content-Type': 'application/json',
                          'Accept': 'application/json',
                          'Authorization': 'Bearer ${currentAuthData.token}',
                        },
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: 15,
                  right: 15,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: Text(
                      titleTips,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
