import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:pollo/core/resources/colors.dart';
import 'package:pollo/core/resources/styles.dart';
import 'package:pollo/features/home/data/model/sub_category_model.dart';

class HomeSubcategoryGridViewItem extends StatelessWidget {
  const HomeSubcategoryGridViewItem({
    super.key,
    required this.subCategoryModel,
  });

  final SubCategoryModel subCategoryModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(10.r),
        border: const GradientBoxBorder(gradient: AppColors.appGradient),
      ),
      child: Column(
        spacing: 8.h,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border:
                    const GradientBoxBorder(gradient: AppColors.appGradient),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.network(
                  subCategoryModel.image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.error, size: 40.w),
                ),
              ),
            ),
          ),
          Text(
            subCategoryModel.name,
            style: TextStyles.style16Bold(),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
