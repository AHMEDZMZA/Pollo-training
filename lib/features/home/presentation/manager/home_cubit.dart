import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo/features/home/data/repo_home.dart';

import '../../../../core/helpers/request_state.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final RepoHome repoHome;

  HomeCubit(this.repoHome) : super(const HomeState());

  final CarouselSliderController carouselController =
      CarouselSliderController();

  void setCurrentPage(int index) {
    emit(state.copyWith(activeIndex: index));
  }

  Future<void> getTopLevelCategoriesList() async {
    emit(state.copyWith(categoriesState: const LoadingState()));
    final result = await repoHome.getTopLevelCategoriesList();
    result.fold(
      (failure) => emit(
        state.copyWith(categoriesState: FailureState(failure.message)),
      ),
      (list) => emit(
        state.copyWith(categoriesState: SuccessState(list)),
      ),
    );
  }
}
