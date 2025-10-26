import 'package:chat_application/features/home/chat_details/data/models/message_model.dart';

class ChatDetailStateModel {
  final bool isLoading;
  final bool isSuccess;
  final bool isFailed;
  final MessageModel messageModel;

  ChatDetailStateModel({
    required this.messageModel,
    this.isLoading = true,
    this.isSuccess = false,
    this.isFailed = false,
  });

  ChatDetailStateModel copyWith({
    MessageModel? messageModel,
    bool? isLoading,
    bool? isSuccess,
    bool? isFailed,
  }) {
    return ChatDetailStateModel(
      messageModel: messageModel ?? this.messageModel,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailed: isFailed ?? this.isFailed,
    );
  }
}
