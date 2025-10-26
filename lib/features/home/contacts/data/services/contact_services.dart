import 'package:chat_application/common/const/url_const.dart';
import 'package:chat_application/features/home/contacts/data/model/contact_model.dart';
import 'package:chat_application/features/home/contacts/data/model/create_chat_model.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class ContactServices {
  Dio dio = GetIt.I.get<Dio>(instanceName: "auth");

  Future<ContactModel> getContacts({String search = ""}) async {
    String params = search.trim().isEmpty ? "" : "=$search";
    final response = await dio.get("${UrlConst.user}$params");
    return ContactModel.fromJson(response.data);
  }

  Future<CreateChatModel> createChat({required String userId}) async {
    final response = await dio.post(
      UrlConst.createChat,
      data: {
        "users": [userId],
      },
    );
    return CreateChatModel.fromJson(response.data);
  }
}
