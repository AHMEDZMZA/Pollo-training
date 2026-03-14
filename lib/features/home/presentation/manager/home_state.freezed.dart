// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  int get activeIndex => throw _privateConstructorUsedError;
  String get searchQuery => throw _privateConstructorUsedError;
  RequestState<List<TopLevelCategoriesListModel>> get categoriesState =>
      throw _privateConstructorUsedError;
  RequestState<List<SubCategoryModel>> get subCategoriesState =>
      throw _privateConstructorUsedError;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {int activeIndex,
      String searchQuery,
      RequestState<List<TopLevelCategoriesListModel>> categoriesState,
      RequestState<List<SubCategoryModel>> subCategoriesState});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeIndex = null,
    Object? searchQuery = null,
    Object? categoriesState = null,
    Object? subCategoriesState = null,
  }) {
    return _then(_value.copyWith(
      activeIndex: null == activeIndex
          ? _value.activeIndex
          : activeIndex // ignore: cast_nullable_to_non_nullable
              as int,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      categoriesState: null == categoriesState
          ? _value.categoriesState
          : categoriesState // ignore: cast_nullable_to_non_nullable
              as RequestState<List<TopLevelCategoriesListModel>>,
      subCategoriesState: null == subCategoriesState
          ? _value.subCategoriesState
          : subCategoriesState // ignore: cast_nullable_to_non_nullable
              as RequestState<List<SubCategoryModel>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int activeIndex,
      String searchQuery,
      RequestState<List<TopLevelCategoriesListModel>> categoriesState,
      RequestState<List<SubCategoryModel>> subCategoriesState});
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeIndex = null,
    Object? searchQuery = null,
    Object? categoriesState = null,
    Object? subCategoriesState = null,
  }) {
    return _then(_$HomeStateImpl(
      activeIndex: null == activeIndex
          ? _value.activeIndex
          : activeIndex // ignore: cast_nullable_to_non_nullable
              as int,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      categoriesState: null == categoriesState
          ? _value.categoriesState
          : categoriesState // ignore: cast_nullable_to_non_nullable
              as RequestState<List<TopLevelCategoriesListModel>>,
      subCategoriesState: null == subCategoriesState
          ? _value.subCategoriesState
          : subCategoriesState // ignore: cast_nullable_to_non_nullable
              as RequestState<List<SubCategoryModel>>,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl(
      {this.activeIndex = 0,
      this.searchQuery = '',
      this.categoriesState = const InitialState(),
      this.subCategoriesState = const InitialState()});

  @override
  @JsonKey()
  final int activeIndex;
  @override
  @JsonKey()
  final String searchQuery;
  @override
  @JsonKey()
  final RequestState<List<TopLevelCategoriesListModel>> categoriesState;
  @override
  @JsonKey()
  final RequestState<List<SubCategoryModel>> subCategoriesState;

  @override
  String toString() {
    return 'HomeState(activeIndex: $activeIndex, searchQuery: $searchQuery, categoriesState: $categoriesState, subCategoriesState: $subCategoriesState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.activeIndex, activeIndex) ||
                other.activeIndex == activeIndex) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.categoriesState, categoriesState) ||
                other.categoriesState == categoriesState) &&
            (identical(other.subCategoriesState, subCategoriesState) ||
                other.subCategoriesState == subCategoriesState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, activeIndex, searchQuery,
      categoriesState, subCategoriesState);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
          {final int activeIndex,
          final String searchQuery,
          final RequestState<List<TopLevelCategoriesListModel>> categoriesState,
          final RequestState<List<SubCategoryModel>> subCategoriesState}) =
      _$HomeStateImpl;

  @override
  int get activeIndex;
  @override
  String get searchQuery;
  @override
  RequestState<List<TopLevelCategoriesListModel>> get categoriesState;
  @override
  RequestState<List<SubCategoryModel>> get subCategoriesState;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
