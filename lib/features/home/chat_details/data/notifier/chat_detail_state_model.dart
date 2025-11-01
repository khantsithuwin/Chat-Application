import 'package:chat_application/features/home/chat_details/data/models/message_model.dart';

class ChatDetailStateModel {
  final bool isLoading;
  final bool isSuccess;
  final bool isFailed;
  final MessageModel messageModel;
  final List<String> tempSendMessage;
  final List<String> tempRecMessage;

  ChatDetailStateModel({
    required this.messageModel,
    this.isLoading = true,
    this.isSuccess = false,
    this.isFailed = false,
    this.tempSendMessage = const [],
    this.tempRecMessage = const [],
  });

  ChatDetailStateModel copyWith({
    MessageModel? messageModel,
    bool? isLoading,
    bool? isSuccess,
    bool? isFailed,
    List<String>? tempSendMessage,
    List<String>? tempRecMessage,
  }) {
    return ChatDetailStateModel(
      messageModel: messageModel ?? this.messageModel,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailed: isFailed ?? this.isFailed,
      tempSendMessage: tempSendMessage ?? this.tempSendMessage,
      tempRecMessage: tempRecMessage ?? this.tempRecMessage,
    );
  }
}
