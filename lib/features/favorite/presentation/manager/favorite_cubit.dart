import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo/features/favorite/data/repo_favorite.dart';

import '../../../../core/helpers/request_state.dart';
import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final RepoFavorite repoFavorite;

  FavoriteCubit(this.repoFavorite) : super(const FavoriteState());

  Future<void> likeProduct(int id) async {
    emit(state.copyWith(favoriteState: const LoadingState()));
    final result = await repoFavorite.likeProduct(id);
    result.fold(
          (failure) =>
          emit(state.copyWith(favoriteState: FailureState(failure.message))),
          (data) {
        final updatedIds = Set<int>.from(state.likedIds);
        if (data.status == 'liked') {
          updatedIds.add(id);
        } else {
          updatedIds.remove(id);
        }
        emit(state.copyWith(
          favoriteState: SuccessState(data),
          likedIds: updatedIds,
        ));
      },
    );
  }}
