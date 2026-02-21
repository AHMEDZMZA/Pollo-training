// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pollo/features/auth/presentation/views/widgets/sign_up/sign_up_footer.dart';
// import 'package:pollo/features/auth/presentation/views/widgets/sign_up/sign_up_form.dart';
// import 'package:pollo/features/auth/presentation/views/widgets/sign_up/sign_up_header.dart';
//
// class SignUpBody extends StatelessWidget {
//   const SignUpBody({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SignUpHeader(),
//           16.verticalSpace,
//           const SignUpForm(),
//           24.verticalSpace,
//           const SignUpFooter(),
//         ],
//       ),
//     );
//   }
// }

// sign_up_body.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/features/auth/presentation/views/widgets/sign_up/sign_up_footer.dart';
import 'package:pollo/features/auth/presentation/views/widgets/sign_up/sign_up_form.dart';
import 'package:pollo/features/auth/presentation/views/widgets/sign_up/sign_up_header.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SignUpHeader(),
            16.verticalSpace,
            SignUpForm(
              firstNameController: firstNameController,
              lastNameController: lastNameController,
              emailController: emailController,
              phoneController: phoneController,
              passwordController: passwordController,
              confirmPasswordController: confirmPasswordController,
            ),
            24.verticalSpace,
            SignUpFooter(
              formKey: _formKey,
              firstNameController: firstNameController,
              lastNameController: lastNameController,
              emailController: emailController,
              phoneController: phoneController,
              passwordController: passwordController,
              confirmPasswordController: confirmPasswordController,
            ),
          ],
        ),
      ),
    );
  }
}