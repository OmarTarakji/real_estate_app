import 'login_response.dart';

sealed class AuthState {
  const AuthState();
}

class Authenticated extends AuthState {
  final LoginResponse loginData;
  const Authenticated(this.loginData);
}

class Unauthenticated extends AuthState {
  const Unauthenticated();
}
