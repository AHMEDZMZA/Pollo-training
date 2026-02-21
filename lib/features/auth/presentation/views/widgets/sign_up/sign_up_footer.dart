import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/helpers/extensions.dart';
import 'package:pollo/core/helpers/locale_keys.dart';
import 'package:pollo/core/resources/colors.dart';
import 'package:pollo/core/resources/styles.dart';
import 'package:pollo/core/widgets/app_button.dart';
import 'package:pollo/core/widgets/gradient_text.dart';

import '../../../manager/auth_cubit.dart';
//
// class SignUpFooter extends StatelessWidget {
//   const SignUpFooter({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         AppButton(
//           title: context.tr(LocaleKeys.signUp),
//           onTap: () {},
//         ),
//         16.verticalSpace,
//         GestureDetector(
//           onTap: () {
//             context.pop();
//           },
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             spacing: 4.w,
//             children: [
//               Text(
//                 context.tr(LocaleKeys.haveAccount),
//                 style: TextStyles.style14Medium(color: AppColors.secondaryText),
//               ),
//               GradientText(
//                 context.tr(LocaleKeys.signIn),
//                 style: TextStyles.style16SemiBold(),
//               )
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }


class SignUpFooter extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController firstNameController;
  final TextEditingController  lastNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const SignUpFooter({
    super.key,
    required this.formKey,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.authModel.firstName ?? ""),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state is AuthErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            state is AuthLoadingState
                ? const CircularProgressIndicator()
                : AppButton(
              title: context.tr(LocaleKeys.signUp),
              onTap: () {
                if (formKey.currentState!.validate()) {
                  context.read<AuthCubit>().register(
                    firstName: firstNameController.text.trim(),
                    lastName: lastNameController.text.trim(),
                    email: emailController.text.trim(),
                    phone: phoneController.text.trim().isEmpty ? null : phoneController.text.trim(),
                    password: passwordController.text,
                    confirmPassword: confirmPasswordController.text,
                  );
                }
              },
            ),
            16.verticalSpace,
            GestureDetector(
              onTap: () => context.pop(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 4.w,
                children: [
                  Text(
                    context.tr(LocaleKeys.haveAccount),
                    style: TextStyles.style14Medium(
                        color: AppColors.secondaryText),
                  ),
                  GradientText(
                    context.tr(LocaleKeys.signIn),
                    style: TextStyles.style16SemiBold(),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}