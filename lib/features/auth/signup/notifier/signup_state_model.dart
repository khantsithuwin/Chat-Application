import 'package:chat_application/features/auth/signup/data/models/signup_model.dart';

class SignupStateModel {
  final bool isLoading;
  final bool isSuccess;
  final bool isFailed;
  final SignupModel? model;

  SignupStateModel({
    this.isLoading = true,
    this.isSuccess = false,
    this.isFailed = false,
    this.model,
  });

  SignupStateModel copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isFailed,
    SignupModel? model,
  }) {
    return SignupStateModel(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailed: isFailed ?? this.isFailed,
      model: model ?? this.model,
    );
  }
}
