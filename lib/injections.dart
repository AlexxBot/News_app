import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/core/network/network_Info.dart';
import 'package:news_app/features/news/data/data_sources/news_remote_data.dart';
import 'package:news_app/features/news/data/repository/news_repository_imple.dart';
import 'package:news_app/features/news/domain/repository/news_repository.dart';
import 'package:news_app/features/news/domain/use_cases/news_use_cases.dart';
import 'package:news_app/features/news/presentation/bloc/news_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  sl.registerFactory(() => NewsBloc(sl()));

  sl.registerLazySingleton<NewsUseCase>(
      () => NewsUseCaseImple(repository: sl()));

  sl.registerLazySingleton<NewsRepository>(
      () => NewsRepositoryImple(remoteData: sl(), networkInfo: sl()));

  sl.registerLazySingleton<NewsRemoteData>(
      () => NewsRemoteDataImple(client: sl()));

  final dio = Dio() /* ..options = BaseOptions() */;

  sl.registerLazySingleton<Dio>(() => dio);

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImple(sl(),
      "https://newsapi.org/v2", "apiKey=d27d9ff2bbef4eab8602224c7a147d40"));

  sl.registerLazySingleton(() => Connectivity());
}
