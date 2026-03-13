import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pollo/core/helpers/request_state.dart';
import 'package:pollo/features/favorite/data/model/favorite_model.dart';
part 'favorite_state.freezed.dart';

@freezed
abstract class FavoriteState with _$FavoriteState {
  const factory FavoriteState({
    @Default(InitialState()) RequestState<FavoriteModel> favoriteState,
    @Default({}) Set<int> likedIds
  }) = _FavoriteState;
}
