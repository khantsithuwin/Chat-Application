import 'package:chat_application/common/const/url_const.dart';
import 'package:chat_application/features/home/chat_details/data/models/message_model.dart';
import 'package:chat_application/features/home/chat_details/data/models/send_message_model.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class ChatDetailService {
  final Dio _dio = GetIt.I.get<Dio>(instanceName: "auth");

  Future<SendMessageModel> sendMessage({
    required chatId,
    required content,
  }) async {
    final response = await _dio.post(
      UrlConst.sendMessage,
      data: {"content": content, "chat_id": chatId},
    );
    return SendMessageModel.fromJson(response.data);
  }

  Future<MessageModel> getAllMesssage({required String chatId}) async {
    final response = await _dio.get(
      "${UrlConst.getAllMessage}?chat_id=$chatId",
    );
    return MessageModel.fromJson(response.data);
  }
}
