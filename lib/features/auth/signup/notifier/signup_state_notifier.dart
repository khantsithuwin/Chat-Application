import 'package:chat_application/features/auth/signup/data/models/services/signup_service.dart';
import 'package:chat_application/features/auth/signup/data/models/signup_model.dart';
import 'package:chat_application/features/auth/signup/notifier/signup_state_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef SignupProvider =
    NotifierProvider<SignupStateNotifier, SignupStateModel>;

class SignupStateNotifier extends Notifier<SignupStateModel> {
  final SignupService _service = SignupService();

  @override
  SignupStateModel build() {
    return SignupStateModel(isLoading: false);
  }

  void tryAgain() {
    state = state.copyWith(isSuccess: false, isFailed: false, isLoading: false);
  }

  void signup({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      state = state.copyWith(
        isLoading: true,
        isFailed: false,
        isSuccess: false,
      );
      SignupModel signupModel = await _service.signup(
        name: name,
        email: email,
        password: password,
      );
      state = state.copyWith(
        isSuccess: true,
        isFailed: false,
        isLoading: false,
        model: signupModel,
      );
    } catch (e) {
      if (e is DioException) {
        final errorResponse = e.response?.data;
        if (errorResponse is Map && errorResponse['message'] != null) {
          state = state.copyWith(
            isLoading: false,
            isFailed: true,
            errorMessage: errorResponse['message'],
          );
        } else {
          state = state.copyWith(
            isFailed: true,
            isLoading: false,
            errorMessage: "unknownError",
          );
        }
      } else {
        state = state.copyWith(
          isFailed: true,
          isLoading: false,
          errorMessage: "unknownError",
        );
      }
    }
  }

  void otpRequest(String email) async {
    try {
      state = state.copyWith(
        isLoading: true,
        isFailed: false,
        isSuccess: false,
      );
      await _service.otpRequest(email: email);
      state = state.copyWith(isLoading: false, isSuccess: true);
    } catch (e) {
      state = state.copyWith(
        isFailed: true,
        isLoading: false,
        errorMessage: "unknownError",
      );
    }
  }

  String failedButtonText(String errorMessage) {
    if (errorMessage == "OTP already sent.") {
      return "Send Again";
    } else if (errorMessage == "Email is already verified.") {
      return "Login";
    } else {
      return "Try Again";
    }
  }
}
