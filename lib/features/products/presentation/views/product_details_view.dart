import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo/core/di/service_locator.dart';
import 'package:pollo/features/products/presentation/manager/products_cubit.dart';
import 'package:pollo/features/products/presentation/views/widgets/product_details/product_details_body.dart';
import '../../../favorite/presentation/manager/favorite_cubit.dart';

class ProductsDetailsView extends StatelessWidget {
  const ProductsDetailsView({
    super.key,
    required this.heroTag,
    required this.productId,
  });

  final String heroTag;
  final int productId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt.get<ProductsCubit>()..getInfoProducts(productId),
        ),
        BlocProvider.value(
          value: getIt.get<FavoriteCubit>(),
        ),
      ],
      child: Scaffold(
        body: ProductDetailsBody(
          heroTag: heroTag,
        ),
      ),
    );
  }
}
