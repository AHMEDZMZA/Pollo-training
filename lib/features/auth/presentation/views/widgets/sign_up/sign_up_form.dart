import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pollo/core/helpers/locale_keys.dart';
import 'package:pollo/core/helpers/validation/app_validator.dart';
import 'package:pollo/core/resources/assets.dart';
import 'package:pollo/core/widgets/app_text_field.dart';
import 'package:pollo/features/auth/presentation/manager/auth_cubit.dart';

import '../../../manager/auth_state.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AuthCubit cubit = context.read<AuthCubit>();
    return Form(
      key: cubit.globalKey,
      child: Column(
        spacing: 16.h,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AppTextField(
            controller: cubit.firstNameController,
            title: context.tr(LocaleKeys.name),
            hintText: context.tr(LocaleKeys.enterYourName),
            keyboardType: TextInputType.name,
            suffixIcon: SvgPicture.asset(AppSvgs.person),
            validator: (value) =>
                AppValidator.validateEmptyField(context, value),
          ),
          AppTextField(
            controller: cubit.lastNameController,
            title: context.tr(LocaleKeys.lastname),
            hintText: context.tr(LocaleKeys.enterYourName),
            keyboardType: TextInputType.name,
            suffixIcon: SvgPicture.asset(AppSvgs.person),
            validator: (value) =>
                AppValidator.validateEmptyField(context, value),
          ),
          AppTextField(
            controller: cubit.emailController,
            title: context.tr(LocaleKeys.email),
            hintText: context.tr(LocaleKeys.enterYourEmail),
            keyboardType: TextInputType.emailAddress,
            suffixIcon: SvgPicture.asset(AppSvgs.email),
            validator: (value) => AppValidator.validateEmail(context, value),
          ),
          AppTextField(
            controller: cubit.phoneController,
            title: context.tr(LocaleKeys.phone),
            hintText: context.tr(LocaleKeys.enterYourNumber),
            keyboardType: TextInputType.phone,
            suffixIcon: SvgPicture.asset(AppSvgs.phone),
            validator: (value) => null, // phone optional
          ),
          BlocBuilder<AuthCubit, AuthState>(
            buildWhen: (previous, current) =>
                previous.isObscure != current.isObscure,
            builder: (context, state) {
              return AppTextField(
                controller: cubit.passwordController,
                title: context.tr(LocaleKeys.password),
                hintText: context.tr(LocaleKeys.enterYourPassword),
                keyboardType: TextInputType.visiblePassword,
                obscureText: state.isObscure,
                suffixIcon: GestureDetector(
                  onTap: () => cubit.toggleObscure(),
                  child: SvgPicture.asset(AppSvgs.eye),
                ),
                validator: (value) =>
                    AppValidator.validateEmptyField(context, value),
              );
            },
          ),
          BlocBuilder<AuthCubit, AuthState>(
            buildWhen: (previous, current) =>
                previous.isObscure != current.isObscure,
            builder: (context, state) {
              return AppTextField(
                controller: cubit.confirmPasswordController,
                title: context.tr(LocaleKeys.confirmPassword),
                hintText: context.tr(LocaleKeys.confirmPassword),
                keyboardType: TextInputType.visiblePassword,
                obscureText: state.isObscure,
                suffixIcon: GestureDetector(
                  onTap: () => cubit.toggleObscure(),
                  child: SvgPicture.asset(AppSvgs.eye),
                ),
                validator: (value) {
                  if (value != cubit.passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return AppValidator.validateEmptyField(context, value);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
