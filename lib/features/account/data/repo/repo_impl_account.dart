import 'package:dartz/dartz.dart';
import 'package:pollo/core/networking/api_client.dart';
import 'package:pollo/core/networking/api_failure.dart';
import 'package:pollo/features/account/data/models/change_password_response_model.dart';
import 'package:pollo/features/account/data/models/profile_request_model.dart';
import 'package:pollo/features/account/data/models/profile_response.dart';
import 'package:pollo/features/account/data/repo/repo_account.dart';

import '../../../../core/networking/api_endpoints.dart';
import '../models/change_password_request_model.dart';

class RepoImplAccount implements RepoAccount {
  final ApiClient apiClient;

  RepoImplAccount({required this.apiClient});

  @override
  Future<Either<Failure, ProfileResponse>> getProfile() {
    return apiClient.request<ProfileResponse>(
        method: ApiMethods.GET,
        endpoint: ApiEndpoints.merchantsInfo,
        response: (json) => ProfileResponse.fromJson(json['merchant']));
  }

  @override
  Future<Either<Failure, ChangePasswordResponseModel>> changePassword(
      {required ChangePasswordRequestModel changePasswordRequestModel}) {
    return apiClient.request<ChangePasswordResponseModel>(
        method: ApiMethods.POST,
        endpoint: ApiEndpoints.merchantsChangePassword,
        body: changePasswordRequestModel.toJson(),
        response: (json) =>
            ChangePasswordResponseModel.fromJson(json['merchant']));
  }

  @override
  Future<Either<Failure, ProfileResponse>> updateProfile(
      {required ProfileRequestModel profileRequestModel}) async{
    final formData = await profileRequestModel.toFormData();
    return apiClient.request(
        method: ApiMethods.POST,
        endpoint: ApiEndpoints.merchantsUpdate,
        body: formData,
        response: (json) => ProfileResponse.fromJson(json['merchant']));
  }
}
