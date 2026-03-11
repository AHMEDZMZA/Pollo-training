import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo/features/account/presentation/views/widgets/changePassword/change_password_body.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../manager/account_cubit.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<AccountCubit>(),
      child: const Scaffold(
        appBar: CustomAppBar(title: 'Change Password'),
        body: ChangePasswordBody(),
      ),
    );
  }
}
