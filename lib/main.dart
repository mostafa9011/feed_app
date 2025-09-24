import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'core/helpers/cache_helper.dart';
import 'core/helpers/flutter_secure_storge_helper.dart';
import 'core/utils/bloc_observer.dart';
import 'core/utils/dependency_injection/di.dart';
import 'feed_app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  await CacheHelper.init();
  await FlutterSecureStorageHelper.init();
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await MobileAds.instance.initialize();

  Bloc.observer = MyBlocObserver();

  runApp(
    const FeedApp(),
  );
}
