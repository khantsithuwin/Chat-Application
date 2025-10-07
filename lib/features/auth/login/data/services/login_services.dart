import 'package:chat_application/common/const/url_const.dart';
import 'package:chat_application/features/auth/login/data/models/login_model.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class LoginServices {
  final Dio _dio = GetIt.I.get();

  Future<LoginModel> login({
    required String email,
    required String password,
  }) async {
    final response = await _dio.post(
      UrlConst.login,
      data: {"email": email, "password": password},
    );
    return LoginModel.fromJson(response.data);
  }
}
