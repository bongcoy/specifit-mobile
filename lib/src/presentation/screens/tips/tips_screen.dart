import 'package:flutter/material.dart';

class TipsScreen extends StatelessWidget {
  const TipsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(
            child: Text(
              'Kapan Waktu yang tepat untuk  berolahraga',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: Image.asset(
              'assets/images/program_1.png',
              fit: BoxFit.cover,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Menemukan waktu untuk berolahraga bisa jadi menantang, dan yang paling penting adalah memerasnya dalam jumlah berapa pun kapan pun Anda bisa. Tetapi jika Anda ingin mengoptimalkan latihan Anda untuk mendapatkan manfaat yang seluas-luasnya, Anda mungkin ingin mencoba berolahraga di pagi hari.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
