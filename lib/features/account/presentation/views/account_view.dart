import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo/core/helpers/request_state.dart';
import 'package:pollo/features/account/presentation/views/widgets/profile/profile_header.dart';
import 'package:pollo/features/account/presentation/views/widgets/profile/profile_settings_list_view.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/toast_helper.dart';
import '../../../../core/networking/dio_factory.dart';
import '../../../../core/routing/routes.dart';
import '../manager/account_cubit.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<AccountCubit>()..getProfile(),
      child: BlocConsumer<AccountCubit, AccountState>(
        buildWhen: (previous, current) =>
            previous.accountState != current.accountState,
        listenWhen: (prev, curr) =>
            prev.deleteAccountState != curr.deleteAccountState,
        listener: (context, state) {
          state.deleteAccountState.listen(
            onFailure: (message) => ToastHelper.showErrorToast(message),
            onSuccess: (_) {
              DioFactory.clearAuthToken();
              context.pushReplacementNamed(Routes.signIn);
            },
          );
        },
        builder: (context, state) {
          return Column(
            children: [
              state.accountState.when(
                onSuccess: (profileResponse) => ProfileHeader(
                  profileResponse: profileResponse,
                  onEditTap: () async {
                    await context.pushNamed(
                      Routes.editProfile,
                      arguments: {'profileResponse': profileResponse},
                    );
                    if (context.mounted) {
                      context.read<AccountCubit>().getProfile();
                    }
                  },
                ),
                onFailure: (message) {
                  ToastHelper.showErrorToast(message);
                  return const SizedBox.shrink();
                },
                onLoading: () =>
                    const Center(child: CircularProgressIndicator()),
              ),
              const ProfileSettingsListView(),
            ],
          );
        },
      ),
    );
  }
}
