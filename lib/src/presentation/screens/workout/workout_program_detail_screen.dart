import 'package:flutter/material.dart';
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
      body: Column(
        children: [
          Text(titleProgram),
          Card(
            child: Column(
              children: const [
                Text("Deskripsi Program"),
                Text(
                  descProgram,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const Expanded(
            child: ProgramTabBar(),
          ),
        ],
      ),
    );
  }
}
