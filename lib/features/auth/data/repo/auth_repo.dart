import 'package:dartz/dartz.dart';
import '../../../../core/networking/api_failure.dart';
import '../model/auth_model.dart';
import '../model/login_request_model.dart';
import '../model/register_request_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthModel>> register({
    required RegisterRequestModel registerRequestModel,
  });

  Future<Either<Failure, AuthModel>> login(
      {required LoginRequestModel loginRequestModel});
}
