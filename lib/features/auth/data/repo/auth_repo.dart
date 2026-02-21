import 'package:dartz/dartz.dart';
import '../../../../core/networking/api_failure.dart';
import '../model/auth_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthModel>> register({
    required String firstName,
    String? lastName,
    required String email,
    String? phone,
    required String password,
    required String confirmPassword,
  });

  Future<Either<Failure, AuthModel>>login({
    required String email,
    required String password,
  });
}
