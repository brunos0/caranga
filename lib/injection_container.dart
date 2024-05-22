import 'package:caranga/core/platform/network_info.dart';
import 'package:caranga/features/fipe/data/datasources/fipe_remote_data_source.dart';
import 'package:caranga/features/fipe/data/datasources/fipe_remote_data_source_impl.dart';
import 'package:caranga/features/fipe/data/repositories/fipe_repository_impl.dart';
import 'package:caranga/features/fipe/presentation/cubit/brands_cubit.dart';
import 'package:caranga/features/fipe/repositories/fipe_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  // Cubit
  sl.registerFactory<BrandsCubit>(() => BrandsCubit(repository: sl()));

  /// Storage
  sl.registerLazySingleton<FlutterSecureStorage>(
      () => const FlutterSecureStorage());

  /// Repository
  sl.registerLazySingleton<FipeRepository>(() => FipeRepositoryImpl(
        networkInfo: sl(),
        fipeRemoteDataSource: sl(),
      ));

  // Data Sources
  sl.registerLazySingleton<FipeRemoteDataSource>(
      () => FipeRemoteDataSourceImpl(client: sl()));

  /// Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  /// External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnection());
}
