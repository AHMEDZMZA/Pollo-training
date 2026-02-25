import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pollo/core/helpers/request_state.dart';
import '../../data/model/top_level_categories_list_model.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(0) int activeIndex,
    @Default(InitialState())
    RequestState<List<TopLevelCategoriesListModel>> categoriesState,
  }) = _HomeState;
}
