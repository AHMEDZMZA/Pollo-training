import 'package:dartz/dartz.dart';

import '../../../../core/networking/api_failure.dart';
import '../model/list_products_model.dart';
import '../model/product_details_model.dart';

abstract class ProductsRepo {
  Future<Either<Failure, List<ListProductsModel>>> getProducts();

  Future<Either<Failure, ProductDetailsModel>> getProductsInfo(int id);
}
