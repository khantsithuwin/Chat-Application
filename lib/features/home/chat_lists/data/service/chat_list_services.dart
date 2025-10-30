import 'package:chat_application/common/const/url_const.dart';
import 'package:chat_application/features/home/chat_lists/data/models/chat_list_model.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class ChatListServices {
  final Dio _dio = GetIt.I.get<Dio>(instanceName: "auth");

  Future<ChatListModel> getAllList() async {
    final response = await _dio.get(UrlConst.getAllList);
    return ChatListModel.fromJson(response.data);
  }
}
