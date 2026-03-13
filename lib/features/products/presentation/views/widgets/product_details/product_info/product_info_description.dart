import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pollo/core/helpers/locale_keys.dart';
import 'package:pollo/core/resources/assets.dart';
import 'package:pollo/core/resources/colors.dart';
import 'package:pollo/core/resources/styles.dart';
import 'package:pollo/core/widgets/star_rating.dart';
import 'package:pollo/features/products/data/model/product_details_model.dart';

class ProductInfoDescription extends StatelessWidget {
  const ProductInfoDescription({
    super.key,
    required this.productDetailsModel,
  });

  final ProductDetailsModel productDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              productDetailsModel.name,
              style: TextStyles.style22SemiBold(),
            ),
            StarRating(
              rating: productDetailsModel.reviewsAvgRating,
              ignoreGestures: true,
              onRatingUpdate: (value) {},
              itemSize: 28.sp,
            ),
          ],
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '${context.tr(LocaleKeys.price)} ',
                style: TextStyles.style16Medium(),
              ),
              TextSpan(
                text: '${productDetailsModel.price} L.E',
                style: TextStyles.style22SemiBold(),
              ),
            ],
          ),
        ),
        8.verticalSpace,
        Row(
          spacing: 4.w,
          children: [
            SvgPicture.asset(
              AppSvgs.pin,
              width: 24.w,
              height: 24.h,
            ),
            Text(
              '${productDetailsModel.country.name} - ${productDetailsModel.state.name}',
              style: TextStyles.style16Medium(color: AppColors.secondaryText),
            ),
            const Spacer(),
            Text(
              productDetailsModel.createdAt,
              style: TextStyles.style16Medium(color: AppColors.secondaryText),
            ),
          ],
        )
      ],
    );
  }
}
