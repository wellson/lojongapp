import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';

import 'commons/app_environment.dart';
import 'commons/app_text.dart';
import 'commons/app_theme.dart';
import 'controllers/inspiration_controller.dart';
import 'pages/main_page.dart';
import 'repositories/inspiration_repository_api.dart';
import 'widgets/main_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final baseOptions = BaseOptions(
    baseUrl: AppEnvironment.apiUrl,
    headers: {
      'Authorization': 'Bearer ${AppEnvironment.apiKey}',
    },
  );
  final cacheOptions = CacheOptions(
    store: HiveCacheStore((await getTemporaryDirectory()).path),
    hitCacheOnErrorExcept: [401, 403],
    maxStale: const Duration(days: 7),
    allowPostMethod: false,
  );
  final dio = Dio(baseOptions)
    ..interceptors.add(DioCacheInterceptor(options: cacheOptions))
    ..interceptors.add(ChuckerDioInterceptor());

  final inspirationRepositoryApi = InspirationRepositoryApi(dio);
  final inspirationController = InspirationController(inspirationRepositoryApi);

  runApp(
    MainWidget(
      showDebugBanner: false,
      title: AppText.appTitle.text,
      lightTheme: AppTheme.lightTheme,
      darkTheme: AppTheme.lightTheme,
      navigatorObservers: [
        ChuckerFlutter.navigatorObserver,
      ],
      child: MainPage(inspirationController),
    ),
  );
}
