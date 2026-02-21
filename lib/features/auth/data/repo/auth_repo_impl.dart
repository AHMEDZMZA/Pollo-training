import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pollo/core/networking/api_failure.dart';
import 'package:pollo/core/networking/api_services.dart';
import 'package:pollo/features/auth/data/model/auth_model.dart';
import 'package:pollo/features/auth/data/repo/auth_repo.dart';
import '../../../../core/helpers/locale_keys.dart';
import '../../../../core/networking/api_endpoints.dart';
import '../../../../core/shared_pref/shared_pref_helper.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;

  AuthRepoImpl({required this.apiService});

  // ================= REGISTER =================

  @override
  Future<Either<Failure, AuthModel>> register({
    required String firstName,
    String? lastName,
    required String email,
    String? phone,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final response = await apiService.post(
        endpoint: ApiEndpoints.register,
        data: {
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          if (phone != null && phone.isNotEmpty) 'phone': phone,
          'password': password,
          'password_confirmation': confirmPassword,
        },
      );

      if (response is Failure) return Left(response);

      if (response is! Map<String, dynamic>) {
        return Left(ServerFailure(tr(LocaleKeys.unknown)));
      }

      if (response['merchant'] == null || response['token'] == null) {
        return Left(ServerFailure(tr(LocaleKeys.unknown)));
      }

      final merchantData = Map<String, dynamic>.from(response['merchant']);
      merchantData['token'] = response['token'];

      final user = AuthModel.fromJson(merchantData);

      if (user.token == null || user.token!.isEmpty) {
        return Left(ServerFailure(tr(LocaleKeys.unknown)));
      }

      await SharedPrefHelper.setData(
        key: SharedPrefKeys.token,
        value: user.token!,
      );

      return Right(user);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (_) {
      return Left(ServerFailure(tr(LocaleKeys.unknown)));
    }
  }

  // ================= LOGIN =================

  @override
  Future<Either<Failure, AuthModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiService.post(
        endpoint: ApiEndpoints.login,
        data: {
          'identifier': email,
          'password': password,
        },
      );

      if (response is Failure) return Left(response);

      if (response is! Map<String, dynamic>) {
        return Left(ServerFailure(tr(LocaleKeys.unknown)));
      }

      if (response['merchant'] == null || response['token'] == null) {
        return Left(ServerFailure(tr(LocaleKeys.unknown)));
      }

      final merchantData = Map<String, dynamic>.from(response['merchant']);
      merchantData['token'] = response['token'];

      final user = AuthModel.fromJson(merchantData);

      if (user.token == null || user.token!.isEmpty) {
        return Left(ServerFailure(tr(LocaleKeys.unknown)));
      }

      await SharedPrefHelper.setData(
        key: SharedPrefKeys.token,
        value: user.token!,
      );

      return Right(user);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (_) {
      return Left(ServerFailure(tr(LocaleKeys.unknown)));
    }
  }
}
