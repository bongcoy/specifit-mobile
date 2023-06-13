import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:specifit/src/domain/models/auth.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier() : super(AuthState.initial()) {
    _loadTokenFromLocalStorage();
  }

  Future<void> _loadTokenFromLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';
    if (token.isEmpty) {
      logout();
    } else {
      login(token);
    }
  }

  Future<void> login(String token) async {
    state = AuthState.loggedIn(token);
    await _saveTokenToLocalStorage(token);
  }

  Future<void> logout() async {
    state = AuthState.loggedOut();
    await _saveTokenToLocalStorage('');
  }

  Future<void> _saveTokenToLocalStorage(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }
}

final userAuthProvider =
    StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  return AuthStateNotifier();
});
