import 'package:dartz/dartz.dart';
import 'package:pollo/core/networking/api_client.dart';
import 'package:pollo/core/networking/api_endpoints.dart';
import 'package:pollo/core/networking/api_failure.dart';
import 'package:pollo/features/home/data/model/sub_category_model.dart';
import 'package:pollo/features/home/data/model/top_level_categories_list_model.dart';
import 'package:pollo/features/home/data/repo_home.dart';

class RepoHomeImplementation implements RepoHome {
  final ApiClient apiClient;

  RepoHomeImplementation({required this.apiClient});

  @override
  Future<Either<Failure, List<TopLevelCategoriesListModel>>>
      getTopLevelCategoriesList() {
    return apiClient.request<List<TopLevelCategoriesListModel>>(
        method: ApiMethods.GET,
        endpoint: ApiEndpoints.categoriesTopLevel,
        response: (json) => (json['data'] as List)
            .map((item) => TopLevelCategoriesListModel.fromJson(item))
            .toList());
  }

  @override
  Future<Either<Failure, List<SubCategoryModel>>> getSubCategories(int id) {
    return apiClient.request(
        method: ApiMethods.GET,
        endpoint: ApiEndpoints.categoriesSubCategories(id),
        response: (json) => (json['data'] as List)
            .map((item) => SubCategoryModel.fromJson(item))
            .toList());
  }
}
