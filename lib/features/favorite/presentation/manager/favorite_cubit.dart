import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo/features/favorite/data/repo_favorite.dart';
import '../../../../core/helpers/request_state.dart';
import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final RepoFavorite repoFavorite;

  FavoriteCubit(this.repoFavorite) : super(const FavoriteState());

  Future<void> storeFavoriteProduct(int id) async {
    emit(state.copyWith(favoriteStoreState: const LoadingState()));
    final result = await repoFavorite.storeFavoriteProduct(id);
    result.fold(
      (failure) => emit(
          state.copyWith(favoriteStoreState: FailureState(failure.message))),
      (data) {
        final updatedIds = Set<int>.from(state.likedIds)..add(id);
        emit(state.copyWith(
          favoriteStoreState: SuccessState(data),
          likedIds: updatedIds,
        ));
        getFavoriteProducts();
      },
    );
  }

  Future<void> deleteFavoriteProduct(int id) async {
    emit(state.copyWith(favoriteDeleteState: const LoadingState()));
    final result = await repoFavorite.deleteFavoriteProduct(id);
    result.fold(
      (failure) => emit(
          state.copyWith(favoriteDeleteState: FailureState(failure.message))),
      (data) {
        final updatedIds = Set<int>.from(state.likedIds)..remove(id);
        emit(state.copyWith(
          favoriteDeleteState: SuccessState(data),
          likedIds: updatedIds,
        ));
        getFavoriteProducts();
      },
    );
  }

  Future<void> getFavoriteProducts() async {
    emit(state.copyWith(favoriteGetState: const LoadingState()));
    final result = await repoFavorite.getFavoriteProducts();
    result.fold(
      (failure) =>
          emit(state.copyWith(favoriteGetState: FailureState(failure.message))),
      (data) {
        debugPrint('wishlist items: ${data.map((e) => 'wishlistId: ${e.id}, productId: ${e.product.id}').toList()}');
        emit(state.copyWith(
          favoriteGetState: SuccessState(data),
          likedIds: data.map((e) => e.product.id).toSet(),
        ));
      },
    );
  }
}
