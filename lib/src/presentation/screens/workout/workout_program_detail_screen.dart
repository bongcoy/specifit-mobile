import 'package:flutter/material.dart';
import 'package:specifit/src/presentation/themes.dart';
import 'package:specifit/src/presentation/widgets/program_tab_bar.dart';

class WorkoutProgramDetailScreen extends StatelessWidget {
  final String titleProgram;
  final String imageUrl;

  const WorkoutProgramDetailScreen({
    Key? key,
    required this.titleProgram,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String descProgram =
        "Latihan ini adalah program berbasis kardio 7 hari untuk pemula. Anda tidak harus berada dalam kondisi yang fit dan sudah blablablablabla ashahahaha";

    return Scaffold(
      appBar: AppBar(),
      backgroundColor: backgroundScreenColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(titleProgram),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              width: double.infinity,
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Deskripsi Program"),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      descProgram,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.52,
              child: const ProgramTabBar(),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: const [
                        Icon(Icons.add),
                        Text("Coba Program"),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.bookmark),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
