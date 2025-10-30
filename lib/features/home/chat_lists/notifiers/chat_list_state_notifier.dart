import 'package:chat_application/features/home/chat_lists/data/models/chat_list_model.dart';
import 'package:chat_application/features/home/chat_lists/data/service/chat_list_services.dart';
import 'package:chat_application/features/home/chat_lists/notifiers/chat_list_state_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef ChatListProvider =
    NotifierProvider<ChatListNotifier, ChatListStateModel>;

class ChatListNotifier extends Notifier<ChatListStateModel> {
  final ChatListServices _services = ChatListServices();

  @override
  ChatListStateModel build() {
    return ChatListStateModel();
  }

  void getChatList() async {
    try {
      state = state.copyWith(
        isLoading: true,
        isFailed: false,
        isSuccess: false,
      );
      ChatListModel chatListModel = await _services.getAllList();
      state = state.copyWith(
        isSuccess: true,
        isFailed: false,
        isLoading: false,
        chatListModel: chatListModel,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isFailed: true,
        isSuccess: false,
      );
    }
  }
}
