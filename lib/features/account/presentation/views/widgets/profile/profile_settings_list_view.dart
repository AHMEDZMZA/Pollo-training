// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pollo/core/helpers/extensions.dart';
// import 'package:pollo/core/helpers/locale_keys.dart';
// import 'package:pollo/core/networking/dio_factory.dart';
// import 'package:pollo/core/resources/assets.dart';
// import 'package:pollo/core/routing/routes.dart';
// import 'package:pollo/features/account/data/models/profile_setting_model.dart';
// import 'package:pollo/features/account/presentation/views/widgets/profile/profile_settings_list_view_item.dart';
//
// import '../../../../../../core/helpers/request_state.dart';
// import '../../../../../../core/widgets/app_button.dart';
// import '../../../../data/models/profile_response.dart';
// import '../../../manager/account_cubit.dart';
//
// class ProfileSettingsListView extends StatelessWidget {
//   const ProfileSettingsListView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final List<ProfileSettingModel> profileSettings = [
//       ProfileSettingModel(
//         svg: AppSvgs.edit,
//         title: context.tr(LocaleKeys.editProfile),
//         onTap: () async {
//           final state = context.read<AccountCubit>().state.accountState;
//           if (state is SuccessState<ProfileResponse>) {
//             await Navigator.pushNamed(
//               context,
//               Routes.editProfile,
//               arguments: {'profileResponse': state.data},
//             );
//             if (context.mounted) {
//               context.read<AccountCubit>().getProfile();
//             }
//           }
//         },
//       ),
//       ProfileSettingModel(
//         svg: AppSvgs.unlock,
//         title: context.tr(LocaleKeys.changePassword),
//         onTap: () {
//           context.pushNamed(
//             Routes.changePassword,
//           );
//         },
//       ),
//       ProfileSettingModel(
//         svg: AppSvgs.settings,
//         title: context.tr(LocaleKeys.settings),
//         onTap: () {
//           context.pushNamed(Routes.settings);
//         },
//       ),
//       ProfileSettingModel(
//         svg: AppSvgs.questionMark,
//         title: context.tr(LocaleKeys.helpSupport),
//         onTap: () {},
//       ),
//       ProfileSettingModel(
//         svg: AppSvgs.logOut,
//         title: context.tr(LocaleKeys.logOut),
//         onTap: () {
//           DioFactory.clearAuthToken();
//           context.pushNamedAndRemoveUntil(
//             Routes.onboarding,
//             predicate: (route) => false,
//           );
//         },
//       ),
//       ProfileSettingModel(
//         svg: AppSvgs.logOut,
//         title: "Delete Account",
//         onTap: () {
//           showDialog(
//             context: context,
//             builder: (_) => AlertDialog(
//               title: const Text("Delete Account"),
//               content: const Text(
//                   "Are you sure you want to delete your account?"),
//               actions: [
//                 TextButton(
//                   onPressed: () => Navigator.pop(context),
//                   child: const Text("Cancel"),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                     final accountState =
//                         context.read<AccountCubit>().state.accountState;
//                     if (accountState is SuccessState<ProfileResponse>) {
//                       context
//                           .read<AccountCubit>()
//                           .deleteAccount(accountState.data.id);
//                     }
//                   },
//                   child: const Text(
//                     "Delete",
//                     style: TextStyle(color: Colors.red),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     ];
//     return Expanded(
//       child: ListView.separated(
//         padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
//         itemBuilder: (context, index) {
//           return InkWell(
//             onTap: profileSettings[index].onTap,
//             borderRadius: BorderRadius.circular(40.r),
//             child: ProfileSettingsListViewItem(
//               profileSetting: profileSettings[index],
//             ),
//           );
//         },
//         separatorBuilder: (context, index) => Divider(
//           height: 16.h,
//           color: const Color(0xffD1D1D1),
//           thickness: 0.7.h,
//         ),
//         itemCount: profileSettings.length,
//       ),
//     );
//   }
// }


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/helpers/extensions.dart';
import 'package:pollo/core/helpers/locale_keys.dart';
import 'package:pollo/core/networking/dio_factory.dart';
import 'package:pollo/core/resources/assets.dart';
import 'package:pollo/core/resources/colors.dart';
import 'package:pollo/core/resources/styles.dart';
import 'package:pollo/core/routing/routes.dart';
import 'package:pollo/features/account/data/models/profile_setting_model.dart';
import 'package:pollo/features/account/presentation/views/widgets/profile/profile_settings_list_view_item.dart';

import '../../../../../../core/helpers/request_state.dart';
import '../../../../data/models/profile_response.dart';
import '../../../manager/account_cubit.dart';

class ProfileSettingsListView extends StatelessWidget {
  const ProfileSettingsListView({super.key});

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 64.r,
                height: 64.r,
                decoration: BoxDecoration(
                  color: Colors.red.withAlpha(20),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.delete_outline_rounded,
                  color: Colors.red,
                  size: 32.r,
                ),
              ),
              16.verticalSpace,
              Text(
                "Delete Account",
                style: TextStyles.style22SemiBold(),
              ),
              8.verticalSpace,
              Text(
                "Are you sure you want to delete your account? This action cannot be undone.",
                style: TextStyles.style14Medium(
                  color: AppColors.secondaryText,
                ),
                textAlign: TextAlign.center,
              ),
              24.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        side: const BorderSide(color: AppColors.border),
                      ),
                      child: Text(
                        "Cancel",
                        style: TextStyles.style16Medium(),
                      ),
                    ),
                  ),
                  12.horizontalSpace,
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        final accountState =
                            context.read<AccountCubit>().state.accountState;
                        if (accountState is SuccessState<ProfileResponse>) {
                          context
                              .read<AccountCubit>()
                              .deleteAccount(accountState.data.id);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        "Delete",
                        style: TextStyles.style16Medium(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<ProfileSettingModel> profileSettings = [
      ProfileSettingModel(
        svg: AppSvgs.edit,
        title: context.tr(LocaleKeys.editProfile),
        onTap: () async {
          final state = context.read<AccountCubit>().state.accountState;
          if (state is SuccessState<ProfileResponse>) {
            await Navigator.pushNamed(
              context,
              Routes.editProfile,
              arguments: {'profileResponse': state.data},
            );
            if (context.mounted) {
              context.read<AccountCubit>().getProfile();
            }
          }
        },
      ),
      ProfileSettingModel(
        svg: AppSvgs.unlock,
        title: context.tr(LocaleKeys.changePassword),
        onTap: () => context.pushNamed(Routes.changePassword),
      ),
      ProfileSettingModel(
        svg: AppSvgs.settings,
        title: context.tr(LocaleKeys.settings),
        onTap: () => context.pushNamed(Routes.settings),
      ),
      ProfileSettingModel(
        svg: AppSvgs.questionMark,
        title: context.tr(LocaleKeys.helpSupport),
        onTap: () {},
      ),
      ProfileSettingModel(
        svg: AppSvgs.logOut,
        title: context.tr(LocaleKeys.logOut),
        onTap: () {
          DioFactory.clearAuthToken();
          context.pushNamedAndRemoveUntil(
            Routes.onboarding,
            predicate: (route) => false,
          );
        },
      ),
      ProfileSettingModel(
        svg: AppSvgs.logOut,
        title: "Delete Account",
        onTap: () => _showDeleteDialog(context),
      ),
    ];

    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: profileSettings[index].onTap,
            borderRadius: BorderRadius.circular(40.r),
            child: ProfileSettingsListViewItem(
              profileSetting: profileSettings[index],
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(
          height: 16.h,
          color: const Color(0xffD1D1D1),
          thickness: 0.7.h,
        ),
        itemCount: profileSettings.length,
      ),
    );
  }
}