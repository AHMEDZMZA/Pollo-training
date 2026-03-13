import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pollo/features/account/data/models/change_password_request_model.dart';
import 'package:pollo/features/account/data/models/change_password_response_model.dart';
import 'package:pollo/features/account/data/models/delete_response_model.dart';
import '../../../../core/helpers/request_state.dart';
import '../../data/models/profile_request_model.dart';
import '../../data/models/profile_response.dart';
import '../../data/repo/repo_account.dart';

part 'account_state.dart';

part 'account_cubit.freezed.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit(this.repoAccount) : super(const AccountState()) {
    firstNameController = TextEditingController();
    lastNameNameController = TextEditingController();
    currentController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  final RepoAccount repoAccount;

  late final TextEditingController firstNameController;
  late final TextEditingController lastNameNameController;
  late final TextEditingController currentController;
  late final TextEditingController newPasswordController;
  late final TextEditingController confirmPasswordController;
  String? selectedImagePath;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      selectedImagePath = picked.path;
      emit(state.copyWith(selectedImage: picked.path));
    }
  }

  @override
  Future<void> close() {
    firstNameController.dispose();
    lastNameNameController.dispose();
    currentController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }

  void toggleObscure() {
    emit(state.copyWith(isObscure: !state.isObscure));
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
      firstName: firstNameController.text.trim(),
      lastName: lastNameNameController.text.trim(),
      image: selectedImagePath,
    );
    final result =
        await repoAccount.updateProfile(profileRequestModel: request);
    result.fold(
      (failure) => emit(
        state.copyWith(updateProfileState: FailureState(failure.message)),
      ),
      (updateProfileResponse) => emit(
        state.copyWith(updateProfileState: SuccessState(updateProfileResponse)),
      ),
    );
  }

  /// Delete
  Future<void> deleteAccount(int id) async {
    emit(state.copyWith(deleteAccountState: const LoadingState()));
    final result = await repoAccount.deleteAccount(id);
    result.fold(
      (failure) => emit(
        state.copyWith(deleteAccountState: FailureState(failure.message)),
      ),
      (deleteAccount) => emit(
        state.copyWith(deleteAccountState: SuccessState(deleteAccount)),
      ),
    );
  }
}
