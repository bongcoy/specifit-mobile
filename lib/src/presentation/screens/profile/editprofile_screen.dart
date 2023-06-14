import 'package:flutter/material.dart';
import 'package:specifit/src/presentation/providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

dynamic profile;

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => EditProfileScreenState();
}

class EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    await dotenv.load(fileName: ".env");
    final authProvider = ref.read(userAuthProvider);
    try {
      http.Response res = await http
          .get(Uri.parse("${dotenv.env['API_URL']!}user"), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authProvider.token}',
      });
      if (res.statusCode == 200) {
        profile = json.decode(res.body);
        setState(() {
          isLoading = false;
          _phoneController.text = profile['data']['phone'];
          _emailController.text = profile['data']['email'];
          _nameController.text = profile['data']['name'];
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  Future _postData() async {
    // final currentAuthData = ref.watch(userAuthProvider);
    try {
      await dotenv.load(fileName: ".env");
      final name = _nameController.text.trim();
      final email = _emailController.text.trim();
      final phone = _phoneController.text.trim();
      http.Response res = await http
          .post(Uri.parse("${dotenv.env['API_URL']!}user/edit"), body: {
        'name': name,
        'email': email,
        'phone': phone,
      }, headers: {
        'Authorization': 'Bearer ${dotenv.env['TOKEN']}',
      });
      if (res.statusCode == 200) {
        profile = json.decode(res.body);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Colors.white,
            title: Text(profile['meta']['status']),
            content: Text(profile['meta']['message']),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
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
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/profile_image.jpg'),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  // Tombol edit gambar ditekan
                },
                child: const Text('Edit Gambar'),
              ),
            ),
            const SizedBox(height: 24),
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Nama'),
                    // initialValue: profile['data']['name'],
                  ),
            const SizedBox(height: 12),
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : TextFormField(
                    controller: _phoneController,
                    decoration: const InputDecoration(labelText: 'Nomor HP'),
                    // initialValue: profile['data']['phone'],
                  ),
            const SizedBox(height: 12),
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Alamat Email'),
                    // initialValue: profile['data']['email'],
                  ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                _postData();
                // Tombol Simpan ditekan
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                onPrimary: Colors.white,
              ),
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
