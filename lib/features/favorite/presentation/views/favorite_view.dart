import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/helpers/locale_keys.dart';
import 'package:pollo/core/resources/styles.dart';
import 'package:pollo/features/favorite/presentation/views/widgets/favorite_list_view.dart';

import '../../../../core/di/service_locator.dart';
import '../manager/favorite_cubit.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<FavoriteCubit>()..getFavoriteProducts(),
      child: SafeArea(
        child: Column(
          children: [
            8.verticalSpace,
            Center(
              child: Text(
                context.tr(LocaleKeys.favorite),
                style: TextStyles.style22SemiBold(),
              ),
            ),
            8.verticalSpace,
            const FavoriteListView(),
          ],
        ),
      ),
    );
  }
}
