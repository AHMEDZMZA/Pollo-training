import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pollo/core/helpers/cubits/app_cubit/app_cubit.dart';
import 'package:pollo/core/networking/api_services.dart';
import 'package:pollo/core/networking/dio_factory.dart';
import 'package:pollo/features/account/data/repo/repo_account.dart';
import 'package:pollo/features/auth/data/repo/auth_repo_impl.dart';
import 'package:pollo/features/auth/presentation/manager/auth_cubit.dart';
import 'package:pollo/features/bottom_nav/presentation/manager/bottom_nav_cubit.dart';
import 'package:pollo/features/drawer_pages/presentation/manager/drawer_pages_cubit.dart';
import 'package:pollo/features/favorite/data/repo_favorite.dart';
import 'package:pollo/features/home/data/repo_home.dart';
import 'package:pollo/features/home/presentation/manager/home_cubit.dart';
import 'package:pollo/features/products/data/repo/products_repo.dart';
import 'package:pollo/features/products/presentation/manager/products_cubit.dart';
import 'package:pollo/features/splash_onboarding/presentation/manager/onboarding_cubit.dart';
import '../../features/account/data/repo/repo_impl_account.dart';
import '../../features/account/presentation/manager/account_cubit.dart';
import '../../features/auth/data/repo/auth_repo.dart';
import '../../features/favorite/data/repo_favorite_implementation.dart';
import '../../features/favorite/presentation/manager/favorite_cubit.dart';
import '../../features/home/data/repo_home_implementation.dart';
import '../../features/products/data/repo/products_repo_impl.dart';
import '../networking/api_client.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Register Dio instance
  getIt.registerSingleton<Dio>(DioFactory.dio);
  // Register API Service with the Dio instance
  getIt.registerSingleton<ApiService>(ApiService(getIt.get<Dio>()));
  // Register application-wide cubits
  getIt.registerFactory<AppCubit>(() => AppCubit());
  // Register API Client
  getIt.registerSingleton<ApiClient>(ApiClient(getIt.get<ApiService>()));
  // <---------------------------------------------------------------------------->
  // Features
  // <---------------------------------------------------------------------------->
  // Onboarding
  getIt.registerFactory<OnboardingCubit>(() => OnboardingCubit());
  // <---------------------------------------------------------------------------->
  // Auth
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(apiClient: getIt.get<ApiClient>()),
  );
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt.get<AuthRepo>()));
  // <---------------------------------------------------------------------------->
  // Bottom Nav
  getIt.registerFactory<BottomNavCubit>(() => BottomNavCubit());
  // <---------------------------------------------------------------------------->
  // Home
  getIt.registerLazySingleton<RepoHome>(
    () => RepoHomeImplementation(
      apiClient: getIt.get<ApiClient>(),
    ),
  );
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(getIt.get<RepoHome>()),
  );
  // <---------------------------------------------------------------------------->
  // Products
  getIt.registerLazySingleton<ProductsRepo>(
    () => ProductsRepoImpl(
      apiClient: getIt.get<ApiClient>(),
    ),
  );
  getIt.registerFactory<ProductsCubit>(
      () => ProductsCubit(getIt.get<ProductsRepo>()));
  // <---------------------------------------------------------------------------->
  // Favorite
// Favorite
  getIt.registerLazySingleton<RepoFavorite>(
        () => RepoFavoriteImplementation(
      apiClient: getIt.get<ApiClient>(),
    ),
  );
  getIt.registerLazySingleton<FavoriteCubit>(
        () => FavoriteCubit(getIt.get<RepoFavorite>()),
  );
  // <---------------------------------------------------------------------------->
  // Drawer Pages
  getIt.registerFactory<DrawerPagesCubit>(() => DrawerPagesCubit());

  // <---------------------------------------------------------------------------->
  // Account
  getIt.registerLazySingleton<RepoAccount>(
    () => RepoImplAccount(
      apiClient: getIt.get<ApiClient>(),
    ),
  );
  getIt.registerFactory<AccountCubit>(
    () => AccountCubit(getIt.get<RepoAccount>()),
  );
}
