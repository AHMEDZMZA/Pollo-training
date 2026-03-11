import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pollo/core/helpers/request_state.dart';
import 'package:pollo/features/home/data/model/sub_category_model.dart';
import '../../data/model/top_level_categories_list_model.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(0) int activeIndex,
    @Default(InitialState()) RequestState<List<TopLevelCategoriesListModel>> categoriesState,
    @Default(InitialState()) RequestState<List<SubCategoryModel>> subCategoriesState,
  }) = _HomeState;
}
