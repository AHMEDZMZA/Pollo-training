import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pollo/core/helpers/extensions.dart';
import 'package:pollo/core/resources/assets.dart';
import 'package:pollo/core/widgets/animation_wrapper/animation_wrapper.dart';
import 'package:pollo/features/products/data/model/product_details_model.dart';
import 'package:pollo/features/products/presentation/views/widgets/product_details/product_header/product_details_header_background.dart';
import '../../../../../../favorite/presentation/manager/favorite_cubit.dart';
import '../../../../../../favorite/presentation/manager/favorite_state.dart';

class ProductDetailsHeader extends StatelessWidget {
  const ProductDetailsHeader({
    super.key,
    required this.heroTag,
    required this.productDetailsModel,
  });

  final String heroTag;
  final ProductDetailsModel productDetailsModel;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      expandedHeight: 312.h,
      pinned: true,
      floating: false,
      snap: false,
      collapsedHeight: 160.h,
      toolbarHeight: 56.h,
      leading: AnimationWrapper(
        child: GestureDetector(
          onTap: () => context.pop(),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20.sp,
            color: Colors.white,
          ),
        ),
      ),
      actions: [
        BlocBuilder<FavoriteCubit, FavoriteState>(
          buildWhen: (previous, current) =>
              previous.likedIds.contains(productDetailsModel.id) !=
              current.likedIds.contains(productDetailsModel.id),
          builder: (context, state) {
            final isLiked = state.likedIds.contains(productDetailsModel.id);
            return GestureDetector(
              onTap: () {
                final cubit = context.read<FavoriteCubit>();
                if (cubit.state.likedIds.contains(productDetailsModel.id)) {
                  cubit.deleteFavoriteProduct(productDetailsModel.id);
                } else {
                  cubit.storeFavoriteProduct(productDetailsModel.id);
                }
              },
              child: AnimationWrapper(
                child: SvgPicture.asset(
                  isLiked ? AppSvgs.heartFill : AppSvgs.heartOutlined,
                  width: 24.w,
                  height: 24.h,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            );
          },
        ),
        16.horizontalSpace,
        AnimationWrapper(
          child: SvgPicture.asset(
            AppSvgs.share,
            width: 24.w,
            height: 24.h,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
      ],
      actionsPadding: EdgeInsets.symmetric(horizontal: 16.w),
      flexibleSpace: ProductDetailsHeaderBackground(
        heroTag: heroTag,
        productDetailsModel: productDetailsModel,
      ),
    );
  }
}
