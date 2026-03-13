// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FavoriteState {
  RequestState<FavoriteModel> get favoriteState =>
      throw _privateConstructorUsedError;
  Set<int> get likedIds => throw _privateConstructorUsedError;

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FavoriteStateCopyWith<FavoriteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteStateCopyWith<$Res> {
  factory $FavoriteStateCopyWith(
          FavoriteState value, $Res Function(FavoriteState) then) =
      _$FavoriteStateCopyWithImpl<$Res, FavoriteState>;
  @useResult
  $Res call({RequestState<FavoriteModel> favoriteState, Set<int> likedIds});
}

/// @nodoc
class _$FavoriteStateCopyWithImpl<$Res, $Val extends FavoriteState>
    implements $FavoriteStateCopyWith<$Res> {
  _$FavoriteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favoriteState = null,
    Object? likedIds = null,
  }) {
    return _then(_value.copyWith(
      favoriteState: null == favoriteState
          ? _value.favoriteState
          : favoriteState // ignore: cast_nullable_to_non_nullable
              as RequestState<FavoriteModel>,
      likedIds: null == likedIds
          ? _value.likedIds
          : likedIds // ignore: cast_nullable_to_non_nullable
              as Set<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoriteStateImplCopyWith<$Res>
    implements $FavoriteStateCopyWith<$Res> {
  factory _$$FavoriteStateImplCopyWith(
          _$FavoriteStateImpl value, $Res Function(_$FavoriteStateImpl) then) =
      __$$FavoriteStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RequestState<FavoriteModel> favoriteState, Set<int> likedIds});
}

/// @nodoc
class __$$FavoriteStateImplCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res, _$FavoriteStateImpl>
    implements _$$FavoriteStateImplCopyWith<$Res> {
  __$$FavoriteStateImplCopyWithImpl(
      _$FavoriteStateImpl _value, $Res Function(_$FavoriteStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favoriteState = null,
    Object? likedIds = null,
  }) {
    return _then(_$FavoriteStateImpl(
      favoriteState: null == favoriteState
          ? _value.favoriteState
          : favoriteState // ignore: cast_nullable_to_non_nullable
              as RequestState<FavoriteModel>,
      likedIds: null == likedIds
          ? _value._likedIds
          : likedIds // ignore: cast_nullable_to_non_nullable
              as Set<int>,
    ));
  }
}

/// @nodoc

class _$FavoriteStateImpl implements _FavoriteState {
  const _$FavoriteStateImpl(
      {this.favoriteState = const InitialState(),
      final Set<int> likedIds = const {}})
      : _likedIds = likedIds;

  @override
  @JsonKey()
  final RequestState<FavoriteModel> favoriteState;
  final Set<int> _likedIds;
  @override
  @JsonKey()
  Set<int> get likedIds {
    if (_likedIds is EqualUnmodifiableSetView) return _likedIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_likedIds);
  }

  @override
  String toString() {
    return 'FavoriteState(favoriteState: $favoriteState, likedIds: $likedIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteStateImpl &&
            (identical(other.favoriteState, favoriteState) ||
                other.favoriteState == favoriteState) &&
            const DeepCollectionEquality().equals(other._likedIds, _likedIds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, favoriteState,
      const DeepCollectionEquality().hash(_likedIds));

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteStateImplCopyWith<_$FavoriteStateImpl> get copyWith =>
      __$$FavoriteStateImplCopyWithImpl<_$FavoriteStateImpl>(this, _$identity);
}

abstract class _FavoriteState implements FavoriteState {
  const factory _FavoriteState(
      {final RequestState<FavoriteModel> favoriteState,
      final Set<int> likedIds}) = _$FavoriteStateImpl;

  @override
  RequestState<FavoriteModel> get favoriteState;
  @override
  Set<int> get likedIds;

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FavoriteStateImplCopyWith<_$FavoriteStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
