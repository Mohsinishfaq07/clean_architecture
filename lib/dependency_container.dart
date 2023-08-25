import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sb_myreports/features/authentication/login/data/data_sources/login_remote_data_source.dart';
import 'package:sb_myreports/features/authentication/login/data/repository/auth_repo_imp.dart';
import 'package:sb_myreports/features/authentication/login/domain/repository/auth_repo.dart';
import 'package:sb_myreports/features/authentication/login/domain/usecases/login_usecase.dart';
import 'package:sb_myreports/features/authentication/login/presentation/manager/auth_provider.dart';
import 'package:sb_myreports/features/jokes/domain/use_cases/get_random_joke.dart';

import 'core/router/app_state.dart';
import 'core/utils/globals/globals.dart';
import 'core/utils/network/network_info.dart';
import 'features/jokes/data/data_sources/jokes_remote_data_source.dart';
import 'features/jokes/data/repositories/joke_repository_imp.dart';
import 'features/jokes/domain/repositories/joke_repository.dart';
import 'features/jokes/presentation/manager/jokeprovider.dart';

Future<void> init() async {
  /// UseCases
  sl.registerLazySingleton(() => LoginUsecase(sl()));
  sl.registerLazySingleton(() => GetRandomJokeUseCase(sl()));

  //Repositories
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImp(dio: sl()));
  sl.registerLazySingleton<JokeRemoteDataSource>(
      () => JokeRemoteDataSourceImp(dio: sl()));

  //Data sources
  sl.registerLazySingleton<AuthRepository>(
      () => LoginRepoImp(networkInfo: sl(), remoteDataSource: sl()));
sl.registerLazySingleton<JokeRepository>(
      () => jokeRepoImp(networkInfo: sl(), remoteDataSource: sl()));

  /// Configs

  /// Repository

  /// External
  sl.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());

  /// Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  /// Providers
  ///
  sl.registerLazySingleton(() => AuthProvider(sl()));
  sl.registerLazySingleton(() => JokeProvider(sl()));
  sl.registerLazySingleton<Dio>(()=>Dio());


  /// Navigator
  sl.registerLazySingleton(() => AppState());
}
