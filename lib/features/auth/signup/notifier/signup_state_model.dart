import 'package:chat_application/features/auth/signup/data/models/signup_model.dart';

class SignupStateModel {
  final bool isLoading;
  final bool isSuccess;
  final bool isFailed;
  final SignupModel? model;
  final String errorMessage;

  SignupStateModel({
    this.isLoading = false,
    this.isSuccess = false,
    this.isFailed = false,
    this.model,
    this.errorMessage = '',
  });

  SignupStateModel copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isFailed,
    SignupModel? model,
    String? errorMessage,
  }) {
    return SignupStateModel(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailed: isFailed ?? this.isFailed,
      model: model ?? this.model,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
