import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo/features/products/data/repo/products_repo.dart';
import 'package:pollo/features/products/presentation/manager/products_state.dart';
import '../../../../core/helpers/request_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.repoProducts) : super(const ProductsState());

  final ProductsRepo repoProducts;

  final double minPrice = 0;
  final double maxPrice = 10000;

  RangeValues get selectedPriceRange =>
      state.priceRange ?? RangeValues(minPrice, maxPrice);

  String? get sortBy => state.sortBy;

  Future<void> getProducts() async {
    emit(state.copyWith(productsState: const LoadingState()));
    final result = await repoProducts.getProducts();
    result.fold(
          (failure) => emit(
        state.copyWith(productsState: FailureState(failure.message)),
      ),
          (products) => emit(
        state.copyWith(productsState: SuccessState(products)),
      ),
    );
  }

  Future<void> getInfoProducts(int id) async {
    emit(state.copyWith(infoProductState: const LoadingState()));
    final result = await repoProducts.getProductsInfo(id);
    result.fold(
          (failure) => emit(
        state.copyWith(infoProductState: FailureState(failure.message)),
      ),
          (products) => emit(
        state.copyWith(infoProductState: SuccessState(products)),
      ),
    );
  }

  void changeActiveIndex(int index) {
    emit(state.copyWith(activeIndex: index));
  }

  void updateSortBy(String? value) {
    emit(state.copyWith(sortBy: value));
  }

  void updatePriceRange(RangeValues priceRange) {
    emit(state.copyWith(priceRange: priceRange));
  }
}