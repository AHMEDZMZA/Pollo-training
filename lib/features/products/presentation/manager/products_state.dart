import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/helpers/request_state.dart';
import '../../data/model/list_products_model.dart';
import '../../data/model/product_details_model.dart';

part 'products_state.freezed.dart';

@freezed
abstract class ProductsState with _$ProductsState {
  const factory ProductsState({
    @Default(0) int activeIndex,
    String? sortBy,
    RangeValues? priceRange,
    @Default(InitialState())
    RequestState<List<ListProductsModel>> productsState,
    @Default(InitialState()) RequestState<ProductDetailsModel> infoProductState,
  }) = _ProductsState;
}
