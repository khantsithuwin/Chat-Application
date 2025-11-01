import 'package:chat_application/common/const/url_const.dart';
import 'package:chat_application/common/theme/theme_notifier.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/storage/app_storage.dart';

Future<void> setupLocator() async {
  Dio dio = Dio();
  dio.options.baseUrl = UrlConst.baseUrl;
  dio.interceptors.add(PrettyDioLogger());
  GetIt.I.registerSingleton<Dio>(dio);

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  GetIt.I.registerSingleton<SharedPreferences>(sharedPreferences);

  GetIt.I.registerSingleton(AppStorage()); //appStorage

  Dio authDio = Dio();
  authDio.options.baseUrl = UrlConst.baseUrl;
  authDio.interceptors.add(PrettyDioLogger());
  authDio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, interceptor) {
        AppStorage storage = GetIt.I.get<AppStorage>();
        options.headers['Authorization'] = "Bearer ${storage.getToken()}";
        interceptor.next(options);
      },
    ),
  );
  GetIt.I.registerSingleton(authDio, instanceName: "auth");

  ThemeProvider themeProvider = ThemeProvider(() {
    return ThemeNotifier();
  });
  GetIt.I.registerSingleton(themeProvider);
}
