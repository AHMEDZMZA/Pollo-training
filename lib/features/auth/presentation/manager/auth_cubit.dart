import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  bool obscureText = false;

  void toggleObscure() {
    obscureText = !obscureText;
    emit(TextObscureChanged());
  }
}
