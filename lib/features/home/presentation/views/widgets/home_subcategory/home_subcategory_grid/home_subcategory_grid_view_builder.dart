import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/helpers/extensions.dart';
import 'package:pollo/core/routing/routes.dart';
import 'package:pollo/features/home/presentation/views/widgets/home_subcategory/home_subcategory_grid/home_category_grid_view_item.dart';

import '../../../../../../../core/helpers/request_state.dart';
import '../../../../manager/home_cubit.dart';
import '../../../../manager/home_state.dart';

class HomeSubcategoryGridViewBuilder extends StatelessWidget {
  const HomeSubcategoryGridViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: RequestStateWhen.changed((state) => state.subCategoriesState),
      builder: (context, state) {
        return state.subCategoriesState.when(
          onLoading: () => const Center(child: CircularProgressIndicator()),
          onSuccess: (subCategories) => subCategories.isEmpty
              ? const Center(
                  child: Text(
                    "No data found",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                )
              : Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16.h,
                      crossAxisSpacing: 16.w,
                      childAspectRatio: 164 / 190,
                    ),
                    itemCount: subCategories.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          context.pushNamed(Routes.products);
                        },
                        child: HomeSubcategoryGridViewItem(
                          subCategoryModel: subCategories[index],
                        ),
                      );
                    },
                  ),
                ),
          onFailure: (error) => ErrorWidget(error),
        );
      },
    );
  }
}
