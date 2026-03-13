import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo/features/products/data/model/product_details_model.dart';
import 'package:pollo/features/products/presentation/manager/products_cubit.dart';

class ProductHeaderCarousel extends StatelessWidget {
  const ProductHeaderCarousel({
    super.key,
    required this.heroTag,
    required this.productDetailsModel,
  });

  final String heroTag;
  final ProductDetailsModel productDetailsModel;

  List<String> get _images => [
    productDetailsModel.image,
    ...productDetailsModel.gallery.map((e) => e.url),
  ];

  @override
  Widget build(BuildContext context) {
    final ProductsCubit cubit = context.read<ProductsCubit>();
    return CarouselSlider.builder(
      itemCount: _images.length,
      itemBuilder: (context, index, realIndex) {
        return Hero(
          tag: index == 0 ? heroTag : '${heroTag}_$index',
          child: Image.network(
            _images[index],
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                Container(color: Colors.grey),
          ),
        );
      },
      options: CarouselOptions(
        height: double.infinity,
        autoPlay: false,
        enlargeCenterPage: false,
        enableInfiniteScroll: false,
        scrollPhysics: const BouncingScrollPhysics(),
        viewportFraction: 1,
        onPageChanged: (index, reason) {
          cubit.changeActiveIndex(index);
        },
      ),
    );
  }
}