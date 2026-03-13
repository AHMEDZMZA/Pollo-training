import 'package:dartz/dartz.dart';
import 'package:pollo/core/networking/api_failure.dart';
import 'package:pollo/features/products/data/model/list_products_model.dart';
import 'package:pollo/features/products/data/repo/products_repo.dart';

import '../../../../core/networking/api_client.dart';
import '../../../../core/networking/api_endpoints.dart';
import '../model/product_details_model.dart';

class ProductsRepoImpl implements ProductsRepo {
  final ApiClient apiClient;

  ProductsRepoImpl({required this.apiClient});

  @override
  Future<Either<Failure, List<ListProductsModel>>> getProducts() async {
    return await apiClient.request<List<ListProductsModel>>(
      method: ApiMethods.GET,
      endpoint: ApiEndpoints.productsList,
      response: (json) => (json['data'] as List)
          .map((e) => ListProductsModel.fromJson(e))
          .toList(),
    );
  }

  @override
  Future<Either<Failure, ProductDetailsModel>> getProductsInfo(int id) async {
    return await apiClient.request<ProductDetailsModel>(
      method: ApiMethods.GET,
      endpoint: ApiEndpoints.productsInfo,
      queryParameters: {'product_id': id},
      response: (json) {
        return ProductDetailsModel.fromJson(json);
      },
    );
  }
}
