import 'package:dartz/dartz.dart';
import 'package:pollo/core/networking/api_client.dart';
import 'package:pollo/core/networking/api_endpoints.dart';
import 'package:pollo/core/networking/api_failure.dart';
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
}

/*
  // getTopLevelCategoriesList() async {
  //   try {
  //     final response =
  //     await apiService.get(endpoint: ApiEndpoints.categoriesTopLevel);
  //
  //     if (response is Failure) return Left(response);
  //
  //     if (response is Map<String, dynamic>) {
  //       final List list = response['data'] ?? [];
  //
  //       final topLevelCategoriesList = list
  //           .map((item) => TopLevelCategoriesListModel.fromJson(item))
  //           .toList();
  //
  //       return Right(topLevelCategoriesList);
  //     }
  //
  //     return Left(ServerFailure(LocaleKeys.unknown.tr()));
  //   } on DioException catch (e) {
  //     return Left(ServerFailure.fromDioException(e));
  //   } catch (e) {
  //     return Left(ServerFailure(e.toString()));
  //   }
  // }
 */
