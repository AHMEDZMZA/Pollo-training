import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pollo/core/helpers/request_state.dart';
import 'package:pollo/features/favorite/data/model/favorite_response_model.dart';

part 'favorite_state.freezed.dart';

@freezed
abstract class FavoriteState with _$FavoriteState {
  const factory FavoriteState({
    @Default(InitialState())
    RequestState<FavoriteResponseModelStoreAndDelete> favoriteStoreState,
    @Default(InitialState())
    RequestState<FavoriteResponseModelStoreAndDelete> favoriteDeleteState,
    @Default(InitialState())
    RequestState<List<WishlistModel>> favoriteGetState,
    @Default(<int>{}) Set<int> likedIds,
  }) = _FavoriteState;
}