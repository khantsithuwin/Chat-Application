import 'package:chat_application/common/const/url_const.dart';
import 'package:chat_application/features/auth/signup/data/models/otp_request.dart';
import 'package:chat_application/features/auth/signup/data/models/signup_model.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class SignupService {
  Dio dio = GetIt.I.get();

  Future<SignupModel> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await dio.post(
      UrlConst.signup,
      data: {"name": name, "email": email, "password": password},
    );
    return SignupModel.fromJson(response.data);
  }

  Future<OtpRequest> otpRequest({required String email}) async {
    final response = await dio.post(
      UrlConst.otpRequest,
      data: {"email": email},
    );
    return OtpRequest.fromJson(response.data);
  }
}
