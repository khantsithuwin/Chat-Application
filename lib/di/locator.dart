import 'package:chat_application/common/const/url_const.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Future<void> setupLocator() async {
  Dio dio = Dio();
  dio.options.baseUrl = UrlConst.baseUrl;
  dio.interceptors.add(PrettyDioLogger());
  GetIt.I.registerSingleton<Dio>(dio);
}
