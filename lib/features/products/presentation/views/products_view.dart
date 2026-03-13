import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/di/service_locator.dart';
import 'package:pollo/core/widgets/custom_app_bar.dart';
import 'package:pollo/features/products/presentation/manager/products_cubit.dart';
import 'package:pollo/features/products/presentation/views/widgets/products/products_body.dart';

import '../../../favorite/presentation/manager/favorite_cubit.dart';
import '../../../home/data/model/sub_category_model.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key, required this.subCategoryModel});

  final SubCategoryModel subCategoryModel;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<ProductsCubit>()..getProducts(),
        ),
        BlocProvider.value(
          value: getIt.get<FavoriteCubit>(),
        ),
      ],
      child: Scaffold(
        appBar: CustomAppBar(title: subCategoryModel.name),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: const ProductsBody(),
        ),
      ),
    );
  }
}
