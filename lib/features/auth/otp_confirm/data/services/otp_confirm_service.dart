import 'package:chat_application/common/const/url_const.dart';
import 'package:chat_application/features/auth/otp_confirm/data/model/otp_confirm_model.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class OtpConfirmServices {
  final Dio _dio = GetIt.I.get();

  Future<OtpConfirmModel> emailVerify({
    required String email,
    required String otpCode,
  }) async {
    final response = await _dio.post(
      UrlConst.emailVerify,
      data: {"email": email, "otp": otpCode},
    );
    return OtpConfirmModel.fromJson(response.data);
  }
}
