import 'package:chat_application/features/home/contacts/data/model/contact_model.dart';

class ContactStateModel {
  final bool isLoading;
  final bool isSuccess;
  final bool isFailed;
  final ContactModel? contactModel;
  final String errorMessage;

  ContactStateModel({
    required this.isLoading,
    required this.isSuccess,
    required this.isFailed,
    required this.contactModel,
    required this.errorMessage,
  });

  ContactStateModel copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isFailed,
    ContactModel? contactModel,
    String? errorMessage,
  }) {
    return ContactStateModel(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailed: isFailed ?? this.isFailed,
      contactModel: contactModel ?? this.contactModel,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
