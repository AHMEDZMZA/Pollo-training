import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pollo/core/helpers/locale_keys.dart';
import 'package:pollo/core/resources/assets.dart';
import 'package:pollo/core/resources/colors.dart';
import 'package:pollo/core/resources/styles.dart';
import 'package:pollo/core/widgets/gradient_text.dart';
import 'package:pollo/core/widgets/star_rating.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../data/model/product_details_model.dart';

class ProductInfoOwner extends StatelessWidget {
  const ProductInfoOwner({super.key, required this.productDetailsModel});

  final ProductDetailsModel productDetailsModel;

  @override
  Widget build(BuildContext context) {
    final String fullName =
        '${productDetailsModel.merchant.firstName} ${productDetailsModel.merchant.lastName}';
    final String firstLetter =
    productDetailsModel.merchant.firstName.isNotEmpty
        ? productDetailsModel.merchant.firstName[0].toUpperCase()
        : '?';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr(LocaleKeys.owner),
          style: TextStyles.style18SemiBold(),
        ),
        8.verticalSpace,
        Row(
          spacing: 8.w,
          children: [
            Container(
              width: 60.r,
              height: 60.r,
              decoration: const BoxDecoration(
                color: Color(0xff06833E),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  firstLetter,
                  style: TextStyles.style22SemiBold(color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: Column(
                spacing: 2.h,
                children: [
                  Row(
                    children: [
                      Text(
                        fullName,
                        style: TextStyles.style16Medium(),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          final phone =
                              productDetailsModel.merchantInfo.merchantPhone;
                          launchUrl(Uri.parse('tel:$phone'));
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AppSvgs.phoneColored,
                              width: 16.w,
                            ),
                            4.horizontalSpace,
                            GradientText(
                              context.tr(LocaleKeys.contact),
                              style: TextStyles.style12Bold(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${context.tr(LocaleKeys.memberSince)} ${productDetailsModel.createdAt}',
                        style: TextStyles.style12Medium(
                            color: AppColors.secondaryText),
                      ),
                      StarRating(
                        rating: productDetailsModel.reviewsAvgRating,
                        onRatingUpdate: (value) {},
                        ignoreGestures: true,
                        itemSize: 18.w,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}