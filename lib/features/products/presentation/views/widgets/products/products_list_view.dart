import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/helpers/extensions.dart';
import 'package:pollo/core/helpers/request_state.dart';
import 'package:pollo/core/routing/routes.dart';
import 'package:pollo/features/products/presentation/manager/products_cubit.dart';
import 'package:pollo/features/products/presentation/manager/products_state.dart';
import 'package:pollo/features/products/presentation/views/widgets/products/products_list_view_item.dart';
import '../../../../../favorite/presentation/manager/favorite_cubit.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ProductsCubit, ProductsState>(
        buildWhen: (previous, current) =>
            previous.productsState != current.productsState,
        builder: (context, state) {
          return state.productsState.when(
            onInitial: () => const SizedBox.shrink(),
            onLoading: () => const Center(child: CircularProgressIndicator()),
            onFailure: (message) => Center(child: Text(message)),
            onSuccess: (data) {
              final products = data;

              if (products.isEmpty) {
                return const Center(child: Text('No products found'));
              }

              return ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                itemCount: products.length,
                separatorBuilder: (context, index) => 16.verticalSpace,
                itemBuilder: (context, index) {
                  final String heroTag = 'product_hero_$index';
                  return GestureDetector(
                      onTap: () {
                        context.pushNamed(
                          Routes.productsDetails,
                          arguments: {
                            'heroTag': heroTag,
                            'productId': products[index].id,
                          },
                        );
                    },
                    child: ProductsListViewItem(
                      heroTag: heroTag,
                      productsModel: products[index],
                      onTap: () {
                        final cubit = context.read<FavoriteCubit>();
                        final productId = products[index].id;
                        if (cubit.state.likedIds.contains(productId)) {
                          final wishlistState = cubit.state.favoriteGetState;
                          if (wishlistState is SuccessState) {
                            final wishlistId = wishlistState.data
                                ?.firstWhere((e) => e.product.id == productId).id;
                            cubit.deleteFavoriteProduct(wishlistId!);
                          }
                        } else {
                          cubit.storeFavoriteProduct(productId);
                        }
                      },
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
