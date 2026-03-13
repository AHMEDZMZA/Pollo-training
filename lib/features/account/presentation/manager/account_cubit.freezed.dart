// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AccountState {
  bool get isObscure => throw _privateConstructorUsedError;
  String? get selectedImage => throw _privateConstructorUsedError;
  RequestState<ProfileResponse> get accountState =>
      throw _privateConstructorUsedError;
  RequestState<ChangePasswordResponseModel> get changePasswordState =>
      throw _privateConstructorUsedError;
  RequestState<ProfileResponse> get updateProfileState =>
      throw _privateConstructorUsedError;
  RequestState<DeleteResponseModel> get deleteAccountState =>
      throw _privateConstructorUsedError;

  /// Create a copy of AccountState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountStateCopyWith<AccountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountStateCopyWith<$Res> {
  factory $AccountStateCopyWith(
          AccountState value, $Res Function(AccountState) then) =
      _$AccountStateCopyWithImpl<$Res, AccountState>;
  @useResult
  $Res call(
      {bool isObscure,
      String? selectedImage,
      RequestState<ProfileResponse> accountState,
      RequestState<ChangePasswordResponseModel> changePasswordState,
      RequestState<ProfileResponse> updateProfileState,
      RequestState<DeleteResponseModel> deleteAccountState});
}

/// @nodoc
class _$AccountStateCopyWithImpl<$Res, $Val extends AccountState>
    implements $AccountStateCopyWith<$Res> {
  _$AccountStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isObscure = null,
    Object? selectedImage = freezed,
    Object? accountState = null,
    Object? changePasswordState = null,
    Object? updateProfileState = null,
    Object? deleteAccountState = null,
  }) {
    return _then(_value.copyWith(
      isObscure: null == isObscure
          ? _value.isObscure
          : isObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedImage: freezed == selectedImage
          ? _value.selectedImage
          : selectedImage // ignore: cast_nullable_to_non_nullable
              as String?,
      accountState: null == accountState
          ? _value.accountState
          : accountState // ignore: cast_nullable_to_non_nullable
              as RequestState<ProfileResponse>,
      changePasswordState: null == changePasswordState
          ? _value.changePasswordState
          : changePasswordState // ignore: cast_nullable_to_non_nullable
              as RequestState<ChangePasswordResponseModel>,
      updateProfileState: null == updateProfileState
          ? _value.updateProfileState
          : updateProfileState // ignore: cast_nullable_to_non_nullable
              as RequestState<ProfileResponse>,
      deleteAccountState: null == deleteAccountState
          ? _value.deleteAccountState
          : deleteAccountState // ignore: cast_nullable_to_non_nullable
              as RequestState<DeleteResponseModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountStateImplCopyWith<$Res>
    implements $AccountStateCopyWith<$Res> {
  factory _$$AccountStateImplCopyWith(
          _$AccountStateImpl value, $Res Function(_$AccountStateImpl) then) =
      __$$AccountStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isObscure,
      String? selectedImage,
      RequestState<ProfileResponse> accountState,
      RequestState<ChangePasswordResponseModel> changePasswordState,
      RequestState<ProfileResponse> updateProfileState,
      RequestState<DeleteResponseModel> deleteAccountState});
}

/// @nodoc
class __$$AccountStateImplCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$AccountStateImpl>
    implements _$$AccountStateImplCopyWith<$Res> {
  __$$AccountStateImplCopyWithImpl(
      _$AccountStateImpl _value, $Res Function(_$AccountStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isObscure = null,
    Object? selectedImage = freezed,
    Object? accountState = null,
    Object? changePasswordState = null,
    Object? updateProfileState = null,
    Object? deleteAccountState = null,
  }) {
    return _then(_$AccountStateImpl(
      isObscure: null == isObscure
          ? _value.isObscure
          : isObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedImage: freezed == selectedImage
          ? _value.selectedImage
          : selectedImage // ignore: cast_nullable_to_non_nullable
              as String?,
      accountState: null == accountState
          ? _value.accountState
          : accountState // ignore: cast_nullable_to_non_nullable
              as RequestState<ProfileResponse>,
      changePasswordState: null == changePasswordState
          ? _value.changePasswordState
          : changePasswordState // ignore: cast_nullable_to_non_nullable
              as RequestState<ChangePasswordResponseModel>,
      updateProfileState: null == updateProfileState
          ? _value.updateProfileState
          : updateProfileState // ignore: cast_nullable_to_non_nullable
              as RequestState<ProfileResponse>,
      deleteAccountState: null == deleteAccountState
          ? _value.deleteAccountState
          : deleteAccountState // ignore: cast_nullable_to_non_nullable
              as RequestState<DeleteResponseModel>,
    ));
  }
}

/// @nodoc

class _$AccountStateImpl implements _AccountState {
  const _$AccountStateImpl(
      {this.isObscure = true,
      this.selectedImage = null,
      this.accountState = const InitialState(),
      this.changePasswordState = const InitialState(),
      this.updateProfileState = const InitialState(),
      this.deleteAccountState = const InitialState()});

  @override
  @JsonKey()
  final bool isObscure;
  @override
  @JsonKey()
  final String? selectedImage;
  @override
  @JsonKey()
  final RequestState<ProfileResponse> accountState;
  @override
  @JsonKey()
  final RequestState<ChangePasswordResponseModel> changePasswordState;
  @override
  @JsonKey()
  final RequestState<ProfileResponse> updateProfileState;
  @override
  @JsonKey()
  final RequestState<DeleteResponseModel> deleteAccountState;

  @override
  String toString() {
    return 'AccountState(isObscure: $isObscure, selectedImage: $selectedImage, accountState: $accountState, changePasswordState: $changePasswordState, updateProfileState: $updateProfileState, deleteAccountState: $deleteAccountState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountStateImpl &&
            (identical(other.isObscure, isObscure) ||
                other.isObscure == isObscure) &&
            (identical(other.selectedImage, selectedImage) ||
                other.selectedImage == selectedImage) &&
            (identical(other.accountState, accountState) ||
                other.accountState == accountState) &&
            (identical(other.changePasswordState, changePasswordState) ||
                other.changePasswordState == changePasswordState) &&
            (identical(other.updateProfileState, updateProfileState) ||
                other.updateProfileState == updateProfileState) &&
            (identical(other.deleteAccountState, deleteAccountState) ||
                other.deleteAccountState == deleteAccountState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isObscure,
      selectedImage,
      accountState,
      changePasswordState,
      updateProfileState,
      deleteAccountState);

  /// Create a copy of AccountState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountStateImplCopyWith<_$AccountStateImpl> get copyWith =>
      __$$AccountStateImplCopyWithImpl<_$AccountStateImpl>(this, _$identity);
}

abstract class _AccountState implements AccountState {
  const factory _AccountState(
          {final bool isObscure,
          final String? selectedImage,
          final RequestState<ProfileResponse> accountState,
          final RequestState<ChangePasswordResponseModel> changePasswordState,
          final RequestState<ProfileResponse> updateProfileState,
          final RequestState<DeleteResponseModel> deleteAccountState}) =
      _$AccountStateImpl;

  @override
  bool get isObscure;
  @override
  String? get selectedImage;
  @override
  RequestState<ProfileResponse> get accountState;
  @override
  RequestState<ChangePasswordResponseModel> get changePasswordState;
  @override
  RequestState<ProfileResponse> get updateProfileState;
  @override
  RequestState<DeleteResponseModel> get deleteAccountState;

  /// Create a copy of AccountState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountStateImplCopyWith<_$AccountStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
