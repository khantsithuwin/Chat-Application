import 'package:chat_application/common/storage/app_storage.dart';
import 'package:chat_application/features/auth/login/data/notifier/login_state_model.dart';
import 'package:chat_application/features/auth/login/data/services/login_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../models/login_model.dart';

typedef LoginProvider = NotifierProvider<LoginStateNotifier, LoginStateModel>;

class LoginStateNotifier extends Notifier<LoginStateModel> {
  final LoginServices _services = LoginServices();

  final AppStorage _storage = GetIt.I.get<AppStorage>();

  @override
  LoginStateModel build() {
    return LoginStateModel(
      isLoading: false,
      isSuccess: false,
      isFailed: false,
      loginModel: null,
    );
  }

  void tryAgain() {
    state = state.copyWith(isSuccess: false, isFailed: false, isLoading: false);
  }

  void login({required String email, required String password}) async {
    try {
      state = state.copyWith(
        isLoading: true,
        isFailed: false,
        isSuccess: false,
      );
      LoginModel loginModel = await _services.login(
        email: email,
        password: password,
      );
      _storage.saveToken(loginModel.data?.token ?? '');
      _storage.saveUserId(loginModel.data?.user?.id ?? '');
      _storage.saveUserName(loginModel.data?.user?.name ?? '');
      state = state.copyWith(
        isSuccess: true,
        loginModel: loginModel,
        isFailed: false,
        isLoading: false,
      );
    } catch (e) {
      if (e is DioException && e.response?.data['message'] != null) {
        state = state.copyWith(
          isLoading: false,
          isFailed: true,
          isSuccess: false,
          errorMessage: e.response?.data['message'],
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          isFailed: true,
          isSuccess: false,
          errorMessage: "Failed to Login",
        );
      }
    }
  }
}
