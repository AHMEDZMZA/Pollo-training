import 'package:easy_localization/easy_localization.dart' as ez;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/helpers/locale_keys.dart';
import 'package:pollo/core/resources/colors.dart';
import 'package:pollo/core/resources/styles.dart';
import 'package:pollo/core/widgets/gradient_text.dart';
import 'package:pollo/features/account/data/models/profile_response.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, required this.profileResponse,  this.onEditTap,});

  final ProfileResponse profileResponse;
  final VoidCallback? onEditTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary2.withAlpha(160),
            AppColors.primary.withAlpha(160),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            56.verticalSpace,
            Text(
              context.tr(LocaleKeys.profile),
              style: TextStyles.style22SemiBold(color: Colors.white),
            ),
            24.verticalSpace,
            Row(
              spacing: 8.w,
              children: [
                Container(
                  width: 80.r,
                  height: 80.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xffECECEC),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4.r,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Center(
                    child: GradientText(
                      profileResponse.firstName[0],
                      style: TextStyles.style24SemiBold(),
                    ),
                  ),
                ),
                Column(
                  spacing: 8.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${profileResponse.firstName} ${profileResponse.lastName}",
                      style: TextStyles.style22SemiBold(color: Colors.white),
                    ),
                    Text(
                      profileResponse.email,
                      style: TextStyles.style16Medium(color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
            24.verticalSpace,
          ],
        ),
      ),
    );
  }
}
