import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/profile_image.jpg'),
            ),
            SizedBox(height: 12),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  // Tombol edit gambar ditekan
                },
                child: Text('Edit Gambar'),
              ),
            ),
            SizedBox(height: 24),
            TextFormField(
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            SizedBox(height: 12),
            TextFormField(
              decoration: InputDecoration(labelText: 'Berat (Kg)'),
            ),
            SizedBox(height: 12),
            TextFormField(
              decoration: InputDecoration(labelText: 'Tinggi (cm)'),
            ),
            SizedBox(height: 12),
            TextFormField(
              decoration: InputDecoration(labelText: 'Nomor HP'),
            ),
            SizedBox(height: 12),
            TextFormField(
              decoration: InputDecoration(labelText: 'Alamat Email'),
            ),
            SizedBox(height: 12),
            Text('Jenis Kelamin'),
            RadioListTile(
              title: Text('Laki-laki'),
              value: 'Laki-laki',
              groupValue: '',
              onChanged: (value) {
                // Radio button Laki-laki dipilih
              },
            ),
            RadioListTile(
              title: Text('Perempuan'),
              value: 'Perempuan',
              groupValue: '',
              onChanged: (value) {
                // Radio button Perempuan dipilih
              },
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Tombol Simpan ditekan
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                onPrimary: Colors.white,
              ),
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
