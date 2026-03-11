import 'package:dartz/dartz.dart';
import 'package:pollo/core/networking/api_failure.dart';
import 'package:pollo/features/account/data/models/change_password_response_model.dart';
import 'package:pollo/features/account/data/models/profile_request_model.dart';
import 'package:pollo/features/account/data/models/profile_response.dart';

import '../models/change_password_request_model.dart';

abstract class RepoAccount {
  Future<Either<Failure, ProfileResponse>> getProfile();

  Future<Either<Failure, ChangePasswordResponseModel>> changePassword(
      {required ChangePasswordRequestModel changePasswordRequestModel});

  Future<Either<Failure, ProfileResponse>> updateProfile(
      {required ProfileRequestModel profileRequestModel});
}
