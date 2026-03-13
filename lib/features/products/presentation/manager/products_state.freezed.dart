// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductsState {
  int get activeIndex => throw _privateConstructorUsedError;
  String? get sortBy => throw _privateConstructorUsedError;
  RangeValues? get priceRange => throw _privateConstructorUsedError;
  RequestState<List<ListProductsModel>> get productsState =>
      throw _privateConstructorUsedError;
  RequestState<ProductDetailsModel> get infoProductState =>
      throw _privateConstructorUsedError;

  /// Create a copy of ProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductsStateCopyWith<ProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsStateCopyWith<$Res> {
  factory $ProductsStateCopyWith(
          ProductsState value, $Res Function(ProductsState) then) =
      _$ProductsStateCopyWithImpl<$Res, ProductsState>;
  @useResult
  $Res call(
      {int activeIndex,
      String? sortBy,
      RangeValues? priceRange,
      RequestState<List<ListProductsModel>> productsState,
      RequestState<ProductDetailsModel> infoProductState});
}

/// @nodoc
class _$ProductsStateCopyWithImpl<$Res, $Val extends ProductsState>
    implements $ProductsStateCopyWith<$Res> {
  _$ProductsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeIndex = null,
    Object? sortBy = freezed,
    Object? priceRange = freezed,
    Object? productsState = null,
    Object? infoProductState = null,
  }) {
    return _then(_value.copyWith(
      activeIndex: null == activeIndex
          ? _value.activeIndex
          : activeIndex // ignore: cast_nullable_to_non_nullable
              as int,
      sortBy: freezed == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as String?,
      priceRange: freezed == priceRange
          ? _value.priceRange
          : priceRange // ignore: cast_nullable_to_non_nullable
              as RangeValues?,
      productsState: null == productsState
          ? _value.productsState
          : productsState // ignore: cast_nullable_to_non_nullable
              as RequestState<List<ListProductsModel>>,
      infoProductState: null == infoProductState
          ? _value.infoProductState
          : infoProductState // ignore: cast_nullable_to_non_nullable
              as RequestState<ProductDetailsModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductsStateImplCopyWith<$Res>
    implements $ProductsStateCopyWith<$Res> {
  factory _$$ProductsStateImplCopyWith(
          _$ProductsStateImpl value, $Res Function(_$ProductsStateImpl) then) =
      __$$ProductsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int activeIndex,
      String? sortBy,
      RangeValues? priceRange,
      RequestState<List<ListProductsModel>> productsState,
      RequestState<ProductDetailsModel> infoProductState});
}

/// @nodoc
class __$$ProductsStateImplCopyWithImpl<$Res>
    extends _$ProductsStateCopyWithImpl<$Res, _$ProductsStateImpl>
    implements _$$ProductsStateImplCopyWith<$Res> {
  __$$ProductsStateImplCopyWithImpl(
      _$ProductsStateImpl _value, $Res Function(_$ProductsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeIndex = null,
    Object? sortBy = freezed,
    Object? priceRange = freezed,
    Object? productsState = null,
    Object? infoProductState = null,
  }) {
    return _then(_$ProductsStateImpl(
      activeIndex: null == activeIndex
          ? _value.activeIndex
          : activeIndex // ignore: cast_nullable_to_non_nullable
              as int,
      sortBy: freezed == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as String?,
      priceRange: freezed == priceRange
          ? _value.priceRange
          : priceRange // ignore: cast_nullable_to_non_nullable
              as RangeValues?,
      productsState: null == productsState
          ? _value.productsState
          : productsState // ignore: cast_nullable_to_non_nullable
              as RequestState<List<ListProductsModel>>,
      infoProductState: null == infoProductState
          ? _value.infoProductState
          : infoProductState // ignore: cast_nullable_to_non_nullable
              as RequestState<ProductDetailsModel>,
    ));
  }
}

/// @nodoc

class _$ProductsStateImpl implements _ProductsState {
  const _$ProductsStateImpl(
      {this.activeIndex = 0,
      this.sortBy,
      this.priceRange,
      this.productsState = const InitialState(),
      this.infoProductState = const InitialState()});

  @override
  @JsonKey()
  final int activeIndex;
  @override
  final String? sortBy;
  @override
  final RangeValues? priceRange;
  @override
  @JsonKey()
  final RequestState<List<ListProductsModel>> productsState;
  @override
  @JsonKey()
  final RequestState<ProductDetailsModel> infoProductState;

  @override
  String toString() {
    return 'ProductsState(activeIndex: $activeIndex, sortBy: $sortBy, priceRange: $priceRange, productsState: $productsState, infoProductState: $infoProductState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductsStateImpl &&
            (identical(other.activeIndex, activeIndex) ||
                other.activeIndex == activeIndex) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy) &&
            (identical(other.priceRange, priceRange) ||
                other.priceRange == priceRange) &&
            (identical(other.productsState, productsState) ||
                other.productsState == productsState) &&
            (identical(other.infoProductState, infoProductState) ||
                other.infoProductState == infoProductState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, activeIndex, sortBy, priceRange,
      productsState, infoProductState);

  /// Create a copy of ProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductsStateImplCopyWith<_$ProductsStateImpl> get copyWith =>
      __$$ProductsStateImplCopyWithImpl<_$ProductsStateImpl>(this, _$identity);
}

abstract class _ProductsState implements ProductsState {
  const factory _ProductsState(
          {final int activeIndex,
          final String? sortBy,
          final RangeValues? priceRange,
          final RequestState<List<ListProductsModel>> productsState,
          final RequestState<ProductDetailsModel> infoProductState}) =
      _$ProductsStateImpl;

  @override
  int get activeIndex;
  @override
  String? get sortBy;
  @override
  RangeValues? get priceRange;
  @override
  RequestState<List<ListProductsModel>> get productsState;
  @override
  RequestState<ProductDetailsModel> get infoProductState;

  /// Create a copy of ProductsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductsStateImplCopyWith<_$ProductsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
