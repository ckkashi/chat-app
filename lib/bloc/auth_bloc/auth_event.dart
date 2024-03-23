part of 'auth_bloc.dart';

sealed class AuthEvent {}

final class AuthLogin extends AuthEvent {
  String email;
  String password;
  AuthLogin({required this.email, required this.password});
}

final class AuthRegister extends AuthEvent {
  String username;
  String email;
  String password;
  String confirmpassword;
  AuthRegister(
      {required this.username,
      required this.email,
      required this.password,
      required this.confirmpassword});
}

final class GetUser extends AuthEvent {}

final class UserLogout extends AuthEvent {}
