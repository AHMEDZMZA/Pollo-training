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
import '../../../data/model/favorite_response_model.dart';
import '../../manager/favorite_cubit.dart';

class FavoriteListViewItem extends StatelessWidget {
  const FavoriteListViewItem({super.key, required this.wishlist});

  final WishlistModel wishlist;

  @override
  Widget build(BuildContext context) {
    final product = wishlist.product;
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
            child: Image.network(
              product.image,
              height: 155.h,
              width: 130.w,
              fit: BoxFit.cover,
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
                          product.name,
                          style: TextStyles.style16Medium(),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => context
                            .read<FavoriteCubit>()
                            .deleteFavoriteProduct(wishlist.id),
                        child: SvgPicture.asset(AppSvgs.heartFill),
                      ),
                    ],
                  ),
                  Text(
                    '${context.tr(LocaleKeys.price)} ${product.price} L.E',
                    style: TextStyles.style16Medium(),
                  ),
                  StarRating(
                    rating: product.reviewsAvgRating,
                    ignoreGestures: true,
                    onRatingUpdate: (value) {},
                  ),
                  Text(
                    '${product.country.name} - ${product.state.name}',
                    style: TextStyles.style14Medium(
                        color: AppColors.secondaryText),
                  ),
                  Text(
                    context.tr(
                      LocaleKeys.daysAgo.plural(2),
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
