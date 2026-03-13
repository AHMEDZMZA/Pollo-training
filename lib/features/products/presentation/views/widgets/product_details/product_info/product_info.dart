import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/features/products/data/model/product_details_model.dart';
import 'package:pollo/features/products/presentation/views/widgets/product_details/product_info/product_info_description.dart';
import 'package:pollo/features/products/presentation/views/widgets/product_details/product_info/product_info_details.dart';
import 'package:pollo/features/products/presentation/views/widgets/product_details/product_info/product_info_location.dart';
import 'package:pollo/features/products/presentation/views/widgets/product_details/product_info/product_info_owner.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    super.key,
    required this.productDetailsModel,
  });

  final ProductDetailsModel productDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
      child: Column(
        children: [
          ProductInfoDescription(productDetailsModel: productDetailsModel),
          24.verticalSpace,
          ProductInfoDetails(productDetailsModel: productDetailsModel),
          24.verticalSpace,
          ProductInfoOwner(productDetailsModel: productDetailsModel),
          24.verticalSpace,
          ProductInfoLocation(productDetailsModel: productDetailsModel),
          24.verticalSpace,
        ],
      ),
    );
  }
}