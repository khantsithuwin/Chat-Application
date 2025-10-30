import '../data/models/chat_list_model.dart';

class ChatListStateModel {
  final bool isLoading;
  final bool isSuccess;
  final bool isFailed;
  ChatListModel? chatListModel;

  ChatListStateModel({
    this.isLoading = true,
    this.isSuccess = false,
    this.isFailed = false,
    this.chatListModel,
  });

  ChatListStateModel copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isFailed,
    ChatListModel? chatListModel,
  }) {
    return ChatListStateModel(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailed: isFailed ?? this.isFailed,
      chatListModel: chatListModel ?? this.chatListModel,
    );
  }
}
