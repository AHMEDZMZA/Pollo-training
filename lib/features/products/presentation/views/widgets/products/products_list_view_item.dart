import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pollo/core/helpers/app_functions.dart';
import 'package:pollo/core/helpers/locale_keys.dart';
import 'package:pollo/core/resources/assets.dart';
import 'package:pollo/core/resources/colors.dart';
import 'package:pollo/core/resources/styles.dart';
import 'package:pollo/core/widgets/star_rating.dart';
import 'package:pollo/features/products/data/model/list_products_model.dart';

import '../../../../../favorite/presentation/manager/favorite_cubit.dart';
import '../../../../../favorite/presentation/manager/favorite_state.dart';

class ProductsListViewItem extends StatelessWidget {
  const ProductsListViewItem({
    super.key,
    required this.heroTag,
    required this.productsModel,
    this.onTap,
  });

  final String heroTag;
  final ListProductsModel productsModel;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 155.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.horizontal(
              left: AppFunctions.isEnglish(context)
                  ? Radius.circular(8.r)
                  : Radius.zero,
              right: AppFunctions.isEnglish(context)
                  ? Radius.zero
                  : Radius.circular(8.r),
            ),
            child: Hero(
              tag: heroTag,
              child: Image.network(
                productsModel.image,
                height: 155.h,
                width: 130.w,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          productsModel.name,
                          style: TextStyles.style16Medium(),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      BlocBuilder<FavoriteCubit, FavoriteState>(
                        buildWhen: (previous, current) =>
                            previous.likedIds.contains(productsModel.id) !=
                            current.likedIds.contains(productsModel.id),
                        builder: (context, state) {
                          final isLiked =
                              state.likedIds.contains(productsModel.id);
                          return GestureDetector(
                            onTap: onTap,
                            child: SvgPicture.asset(
                              isLiked
                                  ? AppSvgs.heartFill
                                  : AppSvgs.heartOutlined,
                              width: 24.r,
                              height: 24.r,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Text(
                    '${context.tr(LocaleKeys.price)} ${productsModel.price}',
                    style: TextStyles.style16Medium(),
                  ),
                  StarRating(
                    rating: productsModel.merchant?.reviewsAvgRating ?? 0,
                    ignoreGestures: true,
                    onRatingUpdate: (value) {},
                  ),
                  Text(
                    '${productsModel.state.name} - ${productsModel.city.name}',
                    style: TextStyles.style14Medium(
                        color: AppColors.secondaryText),
                  ),
                  Text(
                    context.tr(
                      LocaleKeys.daysAgo.plural(
                          AppFunctions.getDaysAgo(productsModel.createdAt)),
                    ),
                    style: TextStyles.style14Medium(
                        color: AppColors.secondaryText),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
