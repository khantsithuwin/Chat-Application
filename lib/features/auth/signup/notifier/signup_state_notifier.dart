import 'package:chat_application/features/auth/signup/data/models/services/signup_service.dart';
import 'package:chat_application/features/auth/signup/data/models/signup_model.dart';
import 'package:chat_application/features/auth/signup/notifier/signup_state_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupStateNotifier extends Notifier<SignupStateModel> {
  SignupService service = SignupService();

  @override
  SignupStateModel build() {
    return SignupStateModel();
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
      SignupModel signupModel = await service.signup(
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
      state = state.copyWith(isFailed: true, isLoading: false);
    }
  }
}
