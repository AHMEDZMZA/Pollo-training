import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo/core/helpers/request_state.dart';
import '../../../../core/networking/dio_factory.dart';
import '../../data/model/login_request_model.dart';
import '../../data/model/register_request_model.dart';
import '../../data/repo/auth_repo.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(const AuthState()) {
    globalKey = GlobalKey<FormState>();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  Future<void> close() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }

  final AuthRepo authRepo;
  late final GlobalKey<FormState> globalKey;
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;

  void toggleObscure() {
    emit(state.copyWith(
      isObscure: !state.isObscure,
    ));
  }

  // ================= REGISTER =================

  Future<void> register() async {
    emit(state.copyWith(authState: const LoadingState()));
    final request = RegisterRequestModel(
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        email: emailController.text.trim(),
        phone: phoneController.text.trim(),
        password: passwordController.text.trim(),
        confirmPassword: confirmPasswordController.text.trim());
    final result = await authRepo.register(
      registerRequestModel: request,
    );
    result.fold(
      (failure) =>
          emit(state.copyWith(authState: FailureState(failure.message))),
      (authModel) async {
        if (authModel.token != null) {
          await DioFactory.updateAuthToken(authModel.token!);
        }

        emit(state.copyWith(authState: SuccessState(authModel)));
      },
    );
  }

  // ================= LOGIN =================

  Future<void> login() async {
    emit(state.copyWith(
      authState: const LoadingState(),
    ));

    final request = LoginRequestModel(
      identifier: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    final result = await authRepo.login(
      loginRequestModel: request,
    );
    result.fold(
        (failure) => emit(
              state.copyWith(
                authState: FailureState(failure.message),
              ),
            ), (authModel) async {
      if (authModel.token != null) {
        await DioFactory.updateAuthToken(authModel.token!);
      }
      emit(
        state.copyWith(
          authState: SuccessState(authModel),
        ),
      );
    });
  }
}
