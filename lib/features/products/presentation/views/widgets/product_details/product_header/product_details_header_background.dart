import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/helpers/app_functions.dart';
import 'package:pollo/features/products/data/model/product_details_model.dart';
import 'package:pollo/features/products/presentation/views/widgets/product_details/product_header/product_header_carousel.dart';
import 'package:pollo/features/products/presentation/views/widgets/product_details/product_header/product_header_carousel_item_count.dart';

class ProductDetailsHeaderBackground extends StatelessWidget {
  const ProductDetailsHeaderBackground({
    super.key,
    required this.heroTag,
    required this.productDetailsModel,
  });

  final String heroTag;
  final ProductDetailsModel productDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ProductHeaderCarousel(
          heroTag: heroTag,
          productDetailsModel: productDetailsModel,
        ),
        Positioned(
          bottom: 16.h,
          left: AppFunctions.isEnglish(context) ? null : 16.w,
          right: AppFunctions.isEnglish(context) ? 16.w : null,
          child: ProductHeaderCarouselItemCount(
            totalCount: productDetailsModel.gallery.length + 1,
          ),
        ),
      ],
    );
  }
}