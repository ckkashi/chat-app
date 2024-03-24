part of 'auth_bloc.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthError extends AuthState {
  String error;
  AuthError({required this.error});
}

final class AuthSuccess extends AuthState {
  String message;
  AuthSuccess({required this.message});
}

final class AuthGetUser extends AuthState {
  UserModel user;
  AuthGetUser({required this.user});
}

final class AuthUserLogout extends AuthState {
  String message;
  AuthUserLogout({required this.message});
}

final class AuthSignedIn extends AuthState {
  User user;
  AuthSignedIn({required this.user});
}

final class AuthNotSignedIn extends AuthState {}
