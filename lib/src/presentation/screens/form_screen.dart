import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:specifit/src/presentation/screens/form_quiz.dart';

class FormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 249, 249, 249),
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 80,
            ),
            Image.asset('assets/images/element_form.png'),
            const SizedBox(
              height: 60,
            ),
            Text(
              'Halo, Nama',
              style: GoogleFonts.openSans(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Kalkulasi kebutuhan kalori dan dapatkan rekomendasi program spesial untuk kamu dengan mengisi beberapa pertanyaan',
              style: GoogleFonts.openSans(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 60,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => const FormQuiz(
                      questions: [
                        "Jenis Kelamin",
                        "Umur",
                        "Tinggi Badan",
                        "Berat Badan",
                        "Tingkat Aktivitas",
                        "Punya Kondisi Medis?"
                      ],
                      options: [
                        ["Laki-laki", "Perempuan"],
                        [],
                        [],
                        [],
                        [
                          "Kurang Aktif (Banyak Duduk)",
                          "Aktivitas Rendah (Olahraga 1-2x seminggu)",
                          "Aktivitas Sedang (Olahraga 3-5x seminggu)",
                          "Aktivitas Tinggi (Olahraga 6-7x seminggu)",
                        ],
                        ["Punya", "Tidak Punya"],
                      ],
                      labels: ["", "tahun", "cm", "kg", "", ""],
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(220, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: const Color.fromARGB(255, 255, 155, 5),
              ),
              child: Text(
                'Mulai',
                style: GoogleFonts.openSans(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
