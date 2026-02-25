import 'package:dartz/dartz.dart';
import 'package:pollo/features/home/data/model/top_level_categories_list_model.dart';
import '../../../core/networking/api_failure.dart';

abstract class RepoHome {
  Future<Either<Failure, List<TopLevelCategoriesListModel>>>
      getTopLevelCategoriesList();
}
