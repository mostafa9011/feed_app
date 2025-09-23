import '../../../features/home/data/datasources/home_remote_data_source.dart';
import '../../../features/home/data/repositories/home_repository_impl.dart';
import '../../../features/home/domain/repositories/home_repository.dart';
import '../../../features/home/presentation/cubit/home_cubit.dart';
import '../../api/dio_consumer.dart';
import 'di.dart';

void registerHomeDependencies() {
  // Register home remote data source
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(dioConsumer: getIt<DioConsumer>()),
  );

  // Register home repository
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      getIt<HomeRemoteDataSource>(),
    ),
  );

  // Register home cubit
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(
      getIt<HomeRepository>(),
    ),
  );
}
