import 'package:feed_app/core/config/config_cubit/config_cubit.dart';

import 'di.dart';

// register factory config cubit
void registerConfigCubit() => sl.registerFactory(() => ConfigCubit());
