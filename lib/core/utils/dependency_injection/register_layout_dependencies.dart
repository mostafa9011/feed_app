import '../../../features/layout/presentation/cubit/layout_cubit.dart';
import 'di.dart';

void registerLayoutDependencies() {
  // Register LayoutCubit
  getIt.registerFactory(() => LayoutCubit());
}
