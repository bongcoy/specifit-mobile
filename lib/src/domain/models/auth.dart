class AuthState {
  final bool isLoggedIn;
  final String token;

  AuthState(this.isLoggedIn, this.token);

  factory AuthState.initial() => AuthState(false, '');

  factory AuthState.loggedIn(String token) => AuthState(true, token);

  factory AuthState.loggedOut() => AuthState(false, '');
}
