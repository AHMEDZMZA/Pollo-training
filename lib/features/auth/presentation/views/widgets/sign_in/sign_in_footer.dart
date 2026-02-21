import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/helpers/extensions.dart';
import 'package:pollo/core/helpers/locale_keys.dart';
import 'package:pollo/core/resources/colors.dart';
import 'package:pollo/core/resources/styles.dart';
import 'package:pollo/core/routing/routes.dart';
import 'package:pollo/core/widgets/app_button.dart';
import 'package:pollo/core/widgets/gradient_text.dart';

import '../../../manager/auth_cubit.dart';

class SignInFooter extends StatelessWidget {
  const SignInFooter({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.authModel.firstName ?? ""),
            backgroundColor: Colors.green,
          ));
          context.pushNamed(Routes.bottomNav);
        } else if (state is AuthErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errorMessage),
            backgroundColor: Colors.red,
          ));
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            state is AuthLoadingState
                ? const CircularProgressIndicator()
                : AppButton(
                    title: context.tr(LocaleKeys.signIn),
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthCubit>().login(
                              email: emailController.text.trim(),
                              password: passwordController.text,
                            );
                      }
                    },
                  ),
            16.verticalSpace,
            GestureDetector(
              onTap: () {
                context.pushNamed(Routes.signUp);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 4.w,
                children: [
                  Text(
                    context.tr(LocaleKeys.dontHaveAccount),
                    style: TextStyles.style14Medium(
                        color: AppColors.secondaryText),
                  ),
                  GradientText(
                    context.tr(LocaleKeys.signUp),
                    style: TextStyles.style16SemiBold(),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
