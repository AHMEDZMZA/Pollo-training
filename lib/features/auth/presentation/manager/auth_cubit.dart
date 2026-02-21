import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/auth_model.dart';
import '../../data/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepo authRepo;
  bool obscureText = false;

  void toggleObscure() {
    obscureText = !obscureText;
    emit(TextObscureChanged());
  }

  Future<void> register({
    required String firstName,
    String? lastName,
    required String email,
    String? phone,
    required String password,
    required String confirmPassword,
  }) async {
    emit(AuthLoadingState());
    final result = await authRepo.register(
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      password: password,
      confirmPassword: confirmPassword,
    );
    result.fold(
      (failure) => emit(AuthErrorState(failure.message)),
      (authModel) => emit(AuthSuccessState(authModel)),
    );
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(AuthLoadingState());
    final result = await authRepo.login(
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(AuthErrorState(failure.message)),
      (authModel) => emit(AuthSuccessState(authModel)),
    );
  }
}
