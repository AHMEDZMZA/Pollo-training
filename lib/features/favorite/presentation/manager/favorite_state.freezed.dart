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
  RequestState<FavoriteResponseModelStoreAndDelete> get favoriteStoreState =>
      throw _privateConstructorUsedError;
  RequestState<FavoriteResponseModelStoreAndDelete> get favoriteDeleteState =>
      throw _privateConstructorUsedError;
  RequestState<List<WishlistModel>> get favoriteGetState =>
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
  $Res call(
      {RequestState<FavoriteResponseModelStoreAndDelete> favoriteStoreState,
      RequestState<FavoriteResponseModelStoreAndDelete> favoriteDeleteState,
      RequestState<List<WishlistModel>> favoriteGetState,
      Set<int> likedIds});
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
    Object? favoriteStoreState = null,
    Object? favoriteDeleteState = null,
    Object? favoriteGetState = null,
    Object? likedIds = null,
  }) {
    return _then(_value.copyWith(
      favoriteStoreState: null == favoriteStoreState
          ? _value.favoriteStoreState
          : favoriteStoreState // ignore: cast_nullable_to_non_nullable
              as RequestState<FavoriteResponseModelStoreAndDelete>,
      favoriteDeleteState: null == favoriteDeleteState
          ? _value.favoriteDeleteState
          : favoriteDeleteState // ignore: cast_nullable_to_non_nullable
              as RequestState<FavoriteResponseModelStoreAndDelete>,
      favoriteGetState: null == favoriteGetState
          ? _value.favoriteGetState
          : favoriteGetState // ignore: cast_nullable_to_non_nullable
              as RequestState<List<WishlistModel>>,
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
  $Res call(
      {RequestState<FavoriteResponseModelStoreAndDelete> favoriteStoreState,
      RequestState<FavoriteResponseModelStoreAndDelete> favoriteDeleteState,
      RequestState<List<WishlistModel>> favoriteGetState,
      Set<int> likedIds});
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
    Object? favoriteStoreState = null,
    Object? favoriteDeleteState = null,
    Object? favoriteGetState = null,
    Object? likedIds = null,
  }) {
    return _then(_$FavoriteStateImpl(
      favoriteStoreState: null == favoriteStoreState
          ? _value.favoriteStoreState
          : favoriteStoreState // ignore: cast_nullable_to_non_nullable
              as RequestState<FavoriteResponseModelStoreAndDelete>,
      favoriteDeleteState: null == favoriteDeleteState
          ? _value.favoriteDeleteState
          : favoriteDeleteState // ignore: cast_nullable_to_non_nullable
              as RequestState<FavoriteResponseModelStoreAndDelete>,
      favoriteGetState: null == favoriteGetState
          ? _value.favoriteGetState
          : favoriteGetState // ignore: cast_nullable_to_non_nullable
              as RequestState<List<WishlistModel>>,
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
      {this.favoriteStoreState = const InitialState(),
      this.favoriteDeleteState = const InitialState(),
      this.favoriteGetState = const InitialState(),
      final Set<int> likedIds = const <int>{}})
      : _likedIds = likedIds;

  @override
  @JsonKey()
  final RequestState<FavoriteResponseModelStoreAndDelete> favoriteStoreState;
  @override
  @JsonKey()
  final RequestState<FavoriteResponseModelStoreAndDelete> favoriteDeleteState;
  @override
  @JsonKey()
  final RequestState<List<WishlistModel>> favoriteGetState;
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
    return 'FavoriteState(favoriteStoreState: $favoriteStoreState, favoriteDeleteState: $favoriteDeleteState, favoriteGetState: $favoriteGetState, likedIds: $likedIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteStateImpl &&
            (identical(other.favoriteStoreState, favoriteStoreState) ||
                other.favoriteStoreState == favoriteStoreState) &&
            (identical(other.favoriteDeleteState, favoriteDeleteState) ||
                other.favoriteDeleteState == favoriteDeleteState) &&
            (identical(other.favoriteGetState, favoriteGetState) ||
                other.favoriteGetState == favoriteGetState) &&
            const DeepCollectionEquality().equals(other._likedIds, _likedIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      favoriteStoreState,
      favoriteDeleteState,
      favoriteGetState,
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
      {final RequestState<FavoriteResponseModelStoreAndDelete>
          favoriteStoreState,
      final RequestState<FavoriteResponseModelStoreAndDelete>
          favoriteDeleteState,
      final RequestState<List<WishlistModel>> favoriteGetState,
      final Set<int> likedIds}) = _$FavoriteStateImpl;

  @override
  RequestState<FavoriteResponseModelStoreAndDelete> get favoriteStoreState;
  @override
  RequestState<FavoriteResponseModelStoreAndDelete> get favoriteDeleteState;
  @override
  RequestState<List<WishlistModel>> get favoriteGetState;
  @override
  Set<int> get likedIds;

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FavoriteStateImplCopyWith<_$FavoriteStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
