import 'package:chat_application/features/auth/login/data/models/login_model.dart';

class LoginStateModel {
  final bool isLoading;
  final bool isSuccess;
  final bool isFailed;
  final LoginModel? loginModel;
  final String errorMessage;

  LoginStateModel({
    required this.isLoading,
    required this.isSuccess,
    required this.isFailed,
    required this.loginModel,
    this.errorMessage = "",
  });

  LoginStateModel copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isFailed,
    LoginModel? loginModel,
    String? errorMessage,
  }) {
    return LoginStateModel(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailed: isFailed ?? this.isFailed,
      loginModel: loginModel,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
