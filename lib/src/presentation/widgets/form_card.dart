import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:specifit/src/presentation/screens/form_screen.dart';

class FormCard extends StatelessWidget {
  const FormCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          clipBehavior: Clip.antiAlias,
          color: Colors.white,
          elevation: 1,
          child: Stack(
            children: [
              Positioned(
                right: -40,
                bottom: 20,
                child: Image.asset('assets/images/element_card_form_1.png'),
              ),
              Positioned(
                bottom: -100,
                left: -40,
                child: Image.asset('assets/images/element_card_form_2.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 24, top: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Lengkapi Datamu dan\ndapatkan Rekomendasi\nProgram dari Kami',
                        style: GoogleFonts.openSans(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => FormScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 255, 155, 5),
                        minimumSize: const Size(120, 25),
                      ),
                      child: Text(
                        'Klik Disini',
                        style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
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
    );
  }
}
