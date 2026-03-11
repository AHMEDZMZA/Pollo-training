import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pollo/features/account/data/models/change_password_request_model.dart';
import 'package:pollo/features/account/data/models/change_password_response_model.dart';
import '../../../../core/helpers/request_state.dart';
import '../../data/models/profile_request_model.dart';
import '../../data/models/profile_response.dart';
import '../../data/repo/repo_account.dart';
part 'account_state.dart';
part 'account_cubit.freezed.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit(this.repoAccount) : super(const AccountState()) {
    emailController = TextEditingController();
    phoneController = TextEditingController();
    currentController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  final RepoAccount repoAccount;
  final ImagePicker _picker = ImagePicker();

  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  late final TextEditingController currentController;
  late final TextEditingController newPasswordController;
  late final TextEditingController confirmPasswordController;

  @override
  Future<void> close() {
    emailController.dispose();
    phoneController.dispose();
    currentController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }

  void toggleObscure() {
    emit(state.copyWith(isObscure: !state.isObscure));
  }

  Future<void> pickImage() async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      emit(state.copyWith(selectedImage: picked.path));
    }
  }

  /// Get Profile
  Future<void> getProfile() async {
    emit(state.copyWith(accountState: const LoadingState()));
    final result = await repoAccount.getProfile();
    result.fold(
          (failure) =>
          emit(state.copyWith(accountState: FailureState(failure.message))),
          (profileResponse) =>
          emit(state.copyWith(accountState: SuccessState(profileResponse))),
    );
  }

  /// ChangePassword
  Future<void> changePassword() async {
    emit(state.copyWith(changePasswordState: const LoadingState()));
    final request = ChangePasswordRequestModel(
      currentPassword: currentController.text.trim(),
      password: newPasswordController.text.trim(),
      passwordConfirmation: confirmPasswordController.text.trim(),
    );
    final result =
    await repoAccount.changePassword(changePasswordRequestModel: request);
    result.fold(
          (failure) => emit(
        state.copyWith(changePasswordState: FailureState(failure.message)),
      ),
          (changePassWord) => emit(
        state.copyWith(changePasswordState: SuccessState(changePassWord)),
      ),
    );
  }

  /// Update Profile
  Future<void> updateProfile() async {
    emit(state.copyWith(updateProfileState: const LoadingState()));
    final request = ProfileRequestModel(
      email: emailController.text.trim(),
      phone: phoneController.text.trim(),
      image: state.selectedImage,
    );
    final result =
    await repoAccount.updateProfile(profileRequestModel: request);
    result.fold(
          (failure) => emit(
        state.copyWith(updateProfileState: FailureState(failure.message)),
      ),
          (updateProfileResponse) => emit(
        state.copyWith(
            updateProfileState: SuccessState(updateProfileResponse)),
      ),
    );
  }
}