// This the dependency injection file,
// it's responsible for initializing the app and its dependencies.

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/dio_consumer.dart';
import 'register_auth_dependencies.dart';
import 'register_config_cubit.dart';
import 'register_home_dependencies.dart';
import 'register_layout_dependencies.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  // Dio consumer instance
  getIt.registerLazySingleton<DioConsumer>(
    () => DioConsumer(
      dio: Dio(),
    ),
  );

  // Shared preferences instance
  final sharedPref = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPref);

  registerConfigCubit();
  registerLayoutDependencies();
  registerAuthDependencies();
  registerHomeDependencies();
}
