import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/helpers/extensions.dart';
import 'package:pollo/core/helpers/request_state.dart';
import 'package:pollo/core/routing/routes.dart';
import 'package:pollo/features/home/presentation/manager/home_cubit.dart';
import 'package:pollo/features/home/presentation/views/widgets/home/home_grid/home_grid_view_item.dart';

import '../../../../manager/home_state.dart';

class HomeGridViewBuilder extends StatelessWidget {
  const HomeGridViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
      previous.categoriesState != current.categoriesState ||
          previous.searchQuery != current.searchQuery,
      builder: (context, state) {
        return state.categoriesState.when(
          onLoading: () => const Center(child: CircularProgressIndicator()),
          onSuccess: (categories) {
            final filtered = state.searchQuery.isEmpty
                ? categories
                : categories
                .where((e) => e.name.toLowerCase()
                .contains(state.searchQuery.toLowerCase()))
                .toList();

            return Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16.h,
                  crossAxisSpacing: 16.w,
                  childAspectRatio: 104 / 95,
                ),
                itemCount: filtered.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.pushNamed(Routes.homeSubcategory, arguments: {
                        'id': filtered[index].id,
                        'name': filtered[index].name,
                      });
                    },
                    child: HomeGridViewItem(
                      topLevelCategoriesListModel: filtered[index],
                    ),
                  );
                },
              ),
            );
          },
          onFailure: (error) => ErrorWidget(error),
        );
      },
        );
  }
}
