import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Bagian 1: Judul Profil dan Gambar
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Profil',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage('assets/profile_image.jpg'),
                      ),
                      SizedBox(width: 16),
                      Align(
                        alignment: Alignment.topRight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nama Profil',
                              style: TextStyle(fontSize: 18),
                            ),
                            // Add more information or widgets related to the profile
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),

            // Bagian 2: Tombol Edit, Tombol Program Tersimpan, dan Tombol History
            //Bagian Edit Profile

            Container(
              width: 200, // Set the desired width of the box
              margin: EdgeInsets.symmetric(horizontal: 30),
              // Adjust the left margin to position the box
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                    onPressed: () {
                      // Add the desired functionality when the button is pressed
                    },
                    icon: Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                    label: Text(
                      'Edit Profile',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 3,
                      )
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),

            Container(
              width: 200, // Set the desired width of the box
              margin: EdgeInsets.symmetric(horizontal: 30),
              // Adjust the left margin to position the box
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                    onPressed: () {
                      // Add the desired functionality when the button is pressed
                    },
                    icon: Icon(
                      Icons.history,
                      color: Colors.black,
                    ),
                    label: Text(
                      'Riwayat Tersimpan',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 3,
                      )
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),

            Container(
              width: 200, // Set the desired width of the box
              margin: EdgeInsets.symmetric(horizontal: 30),
              // Adjust the left margin to position the box
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                    onPressed: () {
                      // Add the desired functionality when the button is pressed
                    },
                    icon: Icon(
                      Icons.archive_rounded,
                      color: Colors.black,
                    ),
                    label: Text(
                      'Program Tersimpan',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 3,
                      )
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 50),

            // Bagian 3: Tombol Logout
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(6),
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color.fromARGB(255, 232, 11, 11),
                    ),
                    child: TextButton.icon(
                      icon: Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Keluar',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        // Tambahkan fungsi ketika tombol Logout di tekan
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
