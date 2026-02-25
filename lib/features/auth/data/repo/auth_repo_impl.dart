import 'package:dartz/dartz.dart';
import 'package:pollo/core/networking/api_client.dart';
import 'package:pollo/core/networking/api_failure.dart';
import 'package:pollo/features/auth/data/model/auth_model.dart';
import 'package:pollo/features/auth/data/repo/auth_repo.dart';
import '../../../../core/networking/api_endpoints.dart';
import '../model/login_request_model.dart';
import '../model/register_request_model.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiClient apiClient;

  AuthRepoImpl({required this.apiClient});

  // ================= REGISTER =================

  @override
  Future<Either<Failure, AuthModel>> register(
      {required RegisterRequestModel registerRequestModel}) {
    return apiClient.request<AuthModel>(
        method: ApiMethods.POST,
        endpoint: ApiEndpoints.register,
        body: registerRequestModel.toJson(),
        response: (json) => AuthModel.fromJson(json));
  }

  // ================= LOGIN =================

  @override
  Future<Either<Failure, AuthModel>> login(
      {required LoginRequestModel loginRequestModel}) {
    return apiClient.request<AuthModel>(
        method: ApiMethods.POST,
        endpoint: ApiEndpoints.login,
        body: loginRequestModel.toJson(),
        response: (json) => AuthModel.fromJson(json));
  }
}
