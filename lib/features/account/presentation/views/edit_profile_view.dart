import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pollo/core/di/service_locator.dart';
import 'package:pollo/features/account/data/models/profile_response.dart';
import '../../../../core/helpers/locale_keys.dart';
import '../../../../core/helpers/request_state.dart';
import '../../../../core/helpers/toast_helper.dart';
import '../../../../core/resources/assets.dart';
import '../../../../core/resources/colors.dart';
import '../../../../core/resources/styles.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/gradient_text.dart';
import '../manager/account_cubit.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key, required this.profileResponse});

  final ProfileResponse profileResponse;

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (_) => getIt.get<AccountCubit>()
        ..firstNameController.text = profileResponse.firstName
        ..lastNameNameController.text = profileResponse.lastName,
      child: BlocConsumer<AccountCubit, AccountState>(
        listenWhen:
            RequestStateWhen.completed((state) => state.updateProfileState),
        listener: (context, state) {
          state.updateProfileState.listen(
            onFailure: (message) => ToastHelper.showErrorToast(message),
            onSuccess: (data) {
              ToastHelper.showSuccessToast("Success");
              Navigator.pop(context);
            },
          );
        },
        buildWhen: (prev, curr) =>
            prev.updateProfileState != curr.updateProfileState ||
            prev.selectedImage != curr.selectedImage,
        builder: (context, state) {
          final cubit = context.read<AccountCubit>();
          return Scaffold(
            body: Column(
              children: [
                // ── Header Gradient ──
                Container(
                  width: double.infinity,
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
                  child: Column(
                    children: [
                      56.verticalSpace,
                      Text(
                        context.tr(LocaleKeys.editProfile),
                        style: TextStyles.style22SemiBold(color: Colors.white),
                      ),
                      24.verticalSpace,
                      24.verticalSpace,
                    ],
                  ),
                ),

                // ── Form ──
                Expanded(
                  child: SingleChildScrollView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () => cubit.pickImage(),
                          child: Center(
                            child: Stack(
                              children: [
                                Container(
                                  width: 80.r,
                                  height: 80.r,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffECECEC),
                                  ),
                                  child: Center(
                                    child: ClipOval(
                                      child: state.selectedImage != null
                                          ? Image.file(
                                        File(state.selectedImage!),
                                        fit: BoxFit.cover,
                                      )
                                          : profileResponse.image.isNotEmpty
                                          ? Image.network(
                                        profileResponse.image,
                                        fit: BoxFit.cover,
                                        errorBuilder: (_, __, ___) => GradientText(
                                          profileResponse.firstName[0],
                                          style: TextStyles.style24SemiBold(),
                                        ),
                                      )
                                          : GradientText(
                                        profileResponse.firstName[0],
                                        style: TextStyles.style24SemiBold(),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    padding: EdgeInsets.all(4.r),
                                    decoration: const BoxDecoration(
                                      color: AppColors.primary,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(Icons.camera_alt, size: 16.r, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        16.verticalSpace,
                        AppTextField(
                            controller: cubit.firstNameController,
                            title: context.tr(LocaleKeys.changeName),
                            hintText: profileResponse.firstName,
                            keyboardType: TextInputType.name,
                            suffixIcon: SvgPicture.asset(AppSvgs.person),
                            validator: null),
                        16.verticalSpace,
                        AppTextField(
                            controller: cubit.lastNameNameController,
                            title: context.tr(LocaleKeys.changeName),
                            hintText: profileResponse.lastName,
                            keyboardType: TextInputType.name,
                            suffixIcon: SvgPicture.asset(AppSvgs.person),
                            validator: null),
                        24.verticalSpace,
                        AppButton(
                          title: context.tr(LocaleKeys.saveChanges),
                          isLoading: state.updateProfileState.isLoading,
                          onTap: () {
                            cubit.updateProfile();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
