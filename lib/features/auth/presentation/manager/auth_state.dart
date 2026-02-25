import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pollo/core/helpers/request_state.dart';
import '../../data/model/auth_model.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool isObscure,
    @Default(InitialState()) RequestState<AuthModel> authState,
  }) = _AuthState;
}
