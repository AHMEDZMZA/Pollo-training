import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/helpers/locale_keys.dart';
import '../../../../../../core/helpers/request_state.dart';
import '../../../../../../core/helpers/toast_helper.dart';
import '../../../../../../core/helpers/validation/app_validator.dart';
import '../../../../../../core/resources/assets.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../../../../../../core/widgets/app_text_field.dart';
import '../../../manager/account_cubit.dart';

class ChangePasswordBody extends StatelessWidget {
  const ChangePasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: BlocConsumer<AccountCubit, AccountState>(
          listenWhen:
              RequestStateWhen.completed((state) => state.changePasswordState),
          listener: (context, state) {
            state.changePasswordState.listen(
              onFailure: (message) => ToastHelper.showErrorToast(message),
              onSuccess: (data) {
                Navigator.pop(context);
                ToastHelper.showSuccessToast("Success");
              },
            );
          },
          buildWhen: (prev, curr) =>
              prev.isObscure != curr.isObscure ||
              prev.changePasswordState != curr.changePasswordState,
          builder: (context, state) {
            final cubit = context.read<AccountCubit>();
            return Column(
              children: [
                AppTextField(
                  controller: cubit.currentController,
                  title: context.tr(LocaleKeys.currentPassword),
                  hintText: context.tr(LocaleKeys.enterYourPassword),
                  keyboardType: TextInputType.visiblePassword,
                  suffixIcon: GestureDetector(
                    onTap: cubit.toggleObscure,
                    child: SvgPicture.asset(AppSvgs.eye),
                  ),
                  validator: (value) =>
                      AppValidator.validateEmptyField(context, value),
                  obscureText: state.isObscure,
                ),
                16.verticalSpace,
                AppTextField(
                  controller: cubit.newPasswordController,
                  title: context.tr(LocaleKeys.password),
                  hintText: context.tr(LocaleKeys.newPassword),
                  keyboardType: TextInputType.visiblePassword,
                  suffixIcon: GestureDetector(
                    onTap: cubit.toggleObscure,
                    child: SvgPicture.asset(AppSvgs.eye),
                  ),
                  validator: (value) =>
                      AppValidator.validateEmptyField(context, value),
                  obscureText: state.isObscure,
                ),
                16.verticalSpace,
                AppTextField(
                  controller: cubit.confirmPasswordController,
                  title: context.tr(LocaleKeys.confirmPassword),
                  hintText: context.tr(LocaleKeys.enterYourPassword),
                  keyboardType: TextInputType.visiblePassword,
                  suffixIcon: GestureDetector(
                    onTap: cubit.toggleObscure,
                    child: SvgPicture.asset(AppSvgs.eye),
                  ),
                  validator: (value) =>
                      AppValidator.validateEmptyField(context, value),
                  obscureText: state.isObscure,
                ),
                15.verticalSpace,
                AppButton(
                  title: context.tr(LocaleKeys.saveChanges),
                  isLoading: state.changePasswordState.isLoading,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      cubit.changePassword();
                    } else {
                      ToastHelper.showErrorToast("Please fill all fields");
                    }
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
