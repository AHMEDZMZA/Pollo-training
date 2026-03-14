import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pollo/core/helpers/request_state.dart';
import 'package:pollo/core/resources/assets.dart';
import 'package:pollo/features/favorite/presentation/views/widgets/favorite_list_view_item.dart';

import '../../manager/favorite_cubit.dart';
import '../../manager/favorite_state.dart';

class FavoriteListView extends StatelessWidget {
  const FavoriteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      buildWhen: (previous, current) =>
          previous.favoriteGetState != current.favoriteGetState,
      builder: (context, state) {
        return state.favoriteGetState.when(
          onInitial: () => const SizedBox.shrink(),
          onLoading: () => const Expanded(
            child: Center(child: CircularProgressIndicator()),
          ),
          onFailure: (message) => Expanded(
            child: Center(child: Text(message)),
          ),
          onSuccess: (data) => data.isEmpty
              ? Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppSvgs.heartActive,
                          width: 83.35.w,
                          height: 70.83.h,
                        ),
                        const Text('There are no data',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff000000),
                            )),
                      ]),
                )
              : Expanded(
                  child: ListView.separated(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                    itemBuilder: (context, index) {
                      return FavoriteListViewItem(wishlist: data[index]);
                    },
                    separatorBuilder: (context, index) => 16.verticalSpace,
                    itemCount: data.length,
                  ),
                ),
        );
      },
    );
  }
}
