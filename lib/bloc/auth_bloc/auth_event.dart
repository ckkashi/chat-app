part of 'auth_bloc.dart';

sealed class AuthEvent {}

final class AuthLoginEvent extends AuthEvent {
  String email;
  String password;
  AuthLoginEvent({required this.email, required this.password});
}

final class AuthRegisterEvent extends AuthEvent {
  String username;
  String email;
  String password;
  String confirmpassword;
  AuthRegisterEvent(
      {required this.username,
      required this.email,
      required this.password,
      required this.confirmpassword});
}

final class AuthSignedInEvent extends AuthEvent {
  User user;
  AuthSignedInEvent({required this.user});
}

final class AuthNotSignedInEvent extends AuthEvent {}

final class GetUserEvent extends AuthEvent {}

final class UserLogoutEvent extends AuthEvent {}
