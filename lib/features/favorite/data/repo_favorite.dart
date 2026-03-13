import 'package:dartz/dartz.dart';
import 'package:pollo/features/favorite/data/model/favorite_model.dart';
import '../../../core/networking/api_failure.dart';

abstract class RepoFavorite {
  Future<Either<Failure, FavoriteModel>> likeProduct(int id);
}
