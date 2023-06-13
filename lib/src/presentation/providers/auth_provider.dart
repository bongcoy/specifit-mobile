import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class AuthProvider {
  static const baseUrl = 'https://specifit.duckdns.org/api';
  late String _token;

  String get token => _token;

  Future<bool> checkAuthStatus() async {
    // Check if the user is authenticated on the server
    final url = Uri.parse('$baseUrl/check_auth');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final isAuthenticated = jsonResponse['isAuthenticated'] as bool;
      return isAuthenticated;
    } else {
      return false;
    }
  }

  Future<void> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        _token = response.body;
      } else {
        throw Exception('Login failed');
      }
    } catch (e) {
      print('Login error: $e');
      rethrow;
    }
  }

  Future<void> signup() async {

  }

  Future<void> logout() async {
    try {
      _token = '';
    } catch (e) {
      print('Logout error: $e');
      rethrow;
    }
  }
}

final authenticationProvider = Provider<AuthProvider>((ref) {
  return AuthProvider();
});

//  Here I have shared the example of a provider used within a provider.
// keep in mind I am reading a provider from a provider not watching it.
//  The docs mention not to use watch in a provider. This is bad for performance
//  if the data changes conitnously your app will suck bad

// final authStateProvider = StreamProvider<User?>((ref) {
//   return ref.read(authenticationProvider).authStateChange;
// });