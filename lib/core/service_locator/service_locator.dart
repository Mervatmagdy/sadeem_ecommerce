import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/connection/network_info.dart';
import 'package:ecommerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommerce/features/categories/data/repositories/category_repository_impl.dart';
import 'package:ecommerce/features/categories/domain/repositories/category_repository.dart';
import 'package:get_it/get_it.dart';

import 'package:ecommerce/core/databases/cache/cache_helper.dart';
import 'package:ecommerce/core/databases/api/api_consumer.dart';
import 'package:ecommerce/core/databases/api/dio_consumer.dart';
import 'package:ecommerce/features/user_login/data/data_sources/user_remote_data_source.dart';

import '../../features/cart/data/data_sources/cart_remote_data_source.dart';
import '../../features/cart/data/repositories/cart_repository_impl.dart';
import '../../features/cart/domain/repositories/cart_repository.dart';
import '../../features/categories/data/datasources/category_remote_data_source.dart';
import '../../features/products/data/data_sources/product_remote_data_source.dart';
import '../../features/products/data/repositories/products_repositories_impl.dart';
import '../../features/products/domain/repositories/product_repository.dart';
import '../../features/products/domain/usecases/get_all_products.dart';
import '../../features/products/domain/usecases/get_product_bycategory.dart';
import '../../features/products/presentation/cubit/product_cubit.dart';
import '../../features/user_login/data/data_sources/user_local_data_source.dart';
import '../../features/user_login/data/repositories/user_repository_impl.dart';
import '../../features/user_login/domain/repositories/user_repository.dart';

class ServiceLocator {
  final getIt = GetIt.instance;

  void setupServiceLocator() {
    // Register DataConnectionChecker
    getIt.registerLazySingleton<DataConnectionChecker>(() => DataConnectionChecker());

    // Register NetworkInfo implementation
    getIt.registerLazySingleton<NetworkInfo>(
          () => NetworkInfoImpl(),
    );
    // Register Dio first
    getIt.registerLazySingleton<Dio>(() => Dio());

    // Register CacheHelper
    getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());

    // Register ApiConsumer with the Dio instance
    getIt.registerLazySingleton<ApiConsumer>(
            () => DioConsumer(dio: getIt<Dio>()));

    // Register UserRemoteDataSource
    getIt.registerLazySingleton<UserRemoteDataSource>(
            () => UserRemoteDataSource());
    getIt.registerLazySingleton<UserRepository>(() =>UserRepositoryImpl());
    getIt.registerLazySingleton<UserLocalDataSource>(() =>UserLocalDataSource());

    //Categories
    getIt.registerLazySingleton<CategoryRemoteDataSource>(() =>CategoryRemoteDataSource());
    getIt.registerLazySingleton<CategoryRepository>(() =>CategoryRepositoryImpl());
    // getIt.registerLazySingleton<CategoryRepository>(() =>CategoryRepositoryImpl());
    // getIt.registerLazySingleton<>(() =>CategoryLocalDataSource());
    //products
    getIt.registerLazySingleton<ProductRemoteDataSource>(() =>ProductRemoteDataSource());
    getIt.registerLazySingleton<ProductRepository>(() =>ProductRepositoryImpl());

    //getIt.registerLazySingleton<ProductLocalDataSource>(() =>ProductLocalDataSource());
    getIt.registerLazySingleton<GetAllProducts>(() => GetAllProducts());
    getIt.registerLazySingleton<GetProductByCategory>(() => GetProductByCategory());
    getIt.registerFactory<ProductCubit>(() => ProductCubit(

    ));
    //Cart
    getIt.registerLazySingleton<CartRemoteDataSource>(() =>CartRemoteDataSource());
    getIt.registerLazySingleton<CartRepository>(() =>CartRepositoryImpl());
    getIt.registerFactory<CartCubit>(() => CartCubit());
    // getIt.registerLazySingleton<CartLocalDataSource>(() =>CartLocalDataSource());

  }
}
