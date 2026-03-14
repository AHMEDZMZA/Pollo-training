import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pollo/core/helpers/locale_keys.dart';
import 'package:pollo/core/resources/assets.dart';
import 'package:pollo/core/resources/colors.dart';
import 'package:pollo/core/resources/styles.dart';

import '../../features/home/presentation/manager/home_cubit.dart';

class StaticSearchField extends StatelessWidget {
  const StaticSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => context.read<HomeCubit>().searchCategories(value),
      decoration: InputDecoration(
        hintText: context.tr(LocaleKeys.searchHint),
        hintStyle: TextStyles.style16Medium(color: AppColors.icon2),
        prefixIcon: Padding(
          padding: EdgeInsets.all(10.r),
          child: SvgPicture.asset(AppSvgs.search, width: 20.w, height: 20.h),
        ),
        filled: true,
        fillColor: AppColors.fieldFillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}