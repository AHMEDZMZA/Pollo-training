import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/colors.dart';
import 'package:pollo/core/resources/styles.dart';

import '../../../../../data/model/top_level_categories_list_model.dart';

class HomeGridViewItem extends StatelessWidget {
  const HomeGridViewItem({
    super.key,
    required this.topLevelCategoriesListModel,
  });

  final TopLevelCategoriesListModel topLevelCategoriesListModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            topLevelCategoriesListModel.image,
            width: 40.w,
            height: 40.h,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                Icon(Icons.error, size: 40.w), // fallback
          ),
          Text(
            topLevelCategoriesListModel.name,
            style: TextStyles.style12Medium(),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
