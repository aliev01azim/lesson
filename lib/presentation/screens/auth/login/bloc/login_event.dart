part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

final class LoginOnTap extends LoginEvent {
  final String email;
  final String password;

  LoginOnTap({required this.email, required this.password});
}
