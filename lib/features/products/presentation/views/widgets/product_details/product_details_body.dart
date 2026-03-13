

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo/core/helpers/request_state.dart';
import 'package:pollo/features/products/presentation/manager/products_cubit.dart';
import 'package:pollo/features/products/presentation/manager/products_state.dart';
import 'package:pollo/features/products/presentation/views/widgets/product_details/product_header/product_details_header.dart';
import 'package:pollo/features/products/presentation/views/widgets/product_details/product_info/product_info.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({
    super.key,
    required this.heroTag,
  });

  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      buildWhen: (previous, current) =>
      previous.infoProductState != current.infoProductState,
      builder: (context, state) {
        return state.infoProductState.when(
          onInitial: () => const SizedBox.shrink(),
          onLoading: () => const Center(child: CircularProgressIndicator()),
          onFailure: (message) => Center(child: Text(message)),
          onSuccess: (data) {
            final product = data;
            return CustomScrollView(
              slivers: [
                ProductDetailsHeader(
                  heroTag: heroTag,
                  productDetailsModel: product,
                ),
                SliverToBoxAdapter(
                  child: ProductInfo(productDetailsModel: product),
                ),
              ],
            );
          },
        );
      },
    );
  }
}