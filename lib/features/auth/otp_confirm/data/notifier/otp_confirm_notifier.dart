import 'package:chat_application/features/auth/otp_confirm/data/notifier/otp_confirm_state_model.dart';
import 'package:chat_application/features/auth/otp_confirm/data/services/otp_confirm_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef OtpConfirmProvider =
    NotifierProvider<OtpConfirmNotifier, OtpConfirmStateModel>;

class OtpConfirmNotifier extends Notifier<OtpConfirmStateModel> {
  final OtpConfirmServices _services = OtpConfirmServices();

  @override
  OtpConfirmStateModel build() {
    return OtpConfirmStateModel(
      isLoading: false,
      isSuccess: false,
      isFailed: false,
    );
  }

  void tryAgain() {
    state = state.copyWith(isLoading: false, isSuccess: false, isFailed: false);
  }

  void verifyEmail({required String email, required String otpCode}) async {
    try {
      state = state.copyWith(
        isLoading: true,
        isFailed: false,
        isSuccess: false,
      );
      await _services.emailVerify(email: email, otpCode: otpCode);
      state = state.copyWith(
        isSuccess: true,
        isFailed: false,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isSuccess: false,
        isFailed: true,
        isLoading: false,
      );
    }
  }
}
