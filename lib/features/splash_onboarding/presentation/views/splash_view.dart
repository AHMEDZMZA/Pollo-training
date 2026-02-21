import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/helpers/extensions.dart';
import 'package:pollo/core/resources/assets.dart';
import 'package:pollo/core/routing/routes.dart';

import '../../../../core/helpers/app_functions.dart';
import '../../../../core/shared_pref/shared_pref_helper.dart';
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  void _startDelay() async {
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      final token = SharedPrefHelper.getString(key: SharedPrefKeys.token);
      if (token.isNotEmpty && !AppFunctions.isTokenExpired(token)) {
        context.pushReplacementNamed(Routes.bottomNav);
      } else {
        context.pushReplacementNamed(Routes.onboarding);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          AppImages.splashLogo,
          width: 230.w,
          height: 95.h,
        ),
      ),
    );
  }
}
