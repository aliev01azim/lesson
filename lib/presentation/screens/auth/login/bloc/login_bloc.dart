import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../../../../infrastructure/utils/consts.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginOnTap>((event, emit) async {
      emit(LoginLoading());
      await Future.delayed(const Duration(seconds: 2));
      final userBox = Hive.box(Boxes.userBox);
      await userBox.put(UserBox.email.name, event.email);
      await userBox.put(UserBox.password.name, event.password);
      emit(LoginLoaded());
    });
  }
}
