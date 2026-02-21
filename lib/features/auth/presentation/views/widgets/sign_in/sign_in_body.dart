import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/features/auth/presentation/views/widgets/sign_in/sign_in_footer.dart';
import 'package:pollo/features/auth/presentation/views/widgets/sign_in/sign_in_form.dart';
import 'package:pollo/features/auth/presentation/views/widgets/sign_in/sign_in_header.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({super.key});

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SignInHeader(),
          16.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                 SignInForm(
                  emailController: emailController,
                  passwordController: passwordController,
                ),
                24.verticalSpace,
                 SignInFooter(
                  emailController: emailController,
                  passwordController: passwordController,
                  formKey: _formKey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

