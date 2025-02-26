import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ysolultion/features/task/data/data_source/post_remote_data_source.dart';
import 'package:ysolultion/features/task/data/repository/post_repository.dart';
import 'package:ysolultion/features/task/domain/repositories/base_posts_repository.dart';
import 'package:ysolultion/features/task/domain/usecases/get_posts_usecase.dart';
import 'package:ysolultion/features/task/presentation/cubit/post_cubit.dart';

final sl = GetIt.instance;

void init() {
  initBloc();
  initFeatures();
  initRepository();
  initDataSources();
  initExternalPackages();
}

void initBloc() {
  sl.registerFactory(() => PostCubit(sl()));
}

void initFeatures() {
  sl.registerLazySingleton(() => GetPostsUsecase(sl()));
}

void initRepository() {
  sl.registerLazySingleton<BasePostsRepository>(() => PostRepository(sl()));
}

void initDataSources() {
  sl.registerLazySingleton<BasePostRemoteDataSource>(
    () => PostRemoteDataSource(dio: sl<Dio>()),
  );
}

void initExternalPackages() {
  sl.registerLazySingleton<Dio>(() => Dio());
}
