part of 'account_cubit.dart';

@freezed
abstract class AccountState with _$AccountState {
  const factory AccountState({
    @Default(true) bool isObscure,
    @Default(null) String? selectedImage,
    @Default(InitialState()) RequestState<ProfileResponse> accountState,
    @Default(InitialState())
    RequestState<ChangePasswordResponseModel> changePasswordState,
    @Default(InitialState()) RequestState<ProfileResponse> updateProfileState,
    @Default(InitialState())
    RequestState<DeleteResponseModel> deleteAccountState,
  }) = _AccountState;
}
