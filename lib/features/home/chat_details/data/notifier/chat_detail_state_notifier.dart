import 'package:chat_application/features/home/chat_details/data/models/message_model.dart';
import 'package:chat_application/features/home/chat_details/data/notifier/chat_detail_state_model.dart';
import 'package:chat_application/features/home/chat_details/data/services/chat_detail_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef ChatDetailProvider =
    NotifierProvider<ChatDetailStateNotifier, ChatDetailStateModel>;

class ChatDetailStateNotifier extends Notifier<ChatDetailStateModel> {
  final ChatDetailService _service = ChatDetailService();

  @override
  ChatDetailStateModel build() {
    return ChatDetailStateModel(messageModel: MessageModel());
  }

  void getAllMessage({required String chatId}) async {
    try {
      state = state.copyWith(
        isLoading: true,
        isFailed: false,
        isSuccess: false,
      );
      MessageModel messageModel = await _service.getAllMesssage(chatId: chatId);
      state = state.copyWith(
        messageModel: messageModel,
        isSuccess: true,
        isFailed: false,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isSuccess: false, isFailed: true);
    }
  }

  Future<void> sendMessage({
    required String chatId,
    required String content,
  }) async {
    try {
      _service.sendMessage(chatId: chatId, content: content);
    } catch (e) {
      Future.error(e);
    }
  }
}
