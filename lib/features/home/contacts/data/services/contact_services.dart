import 'package:chat_application/common/const/url_const.dart';
import 'package:chat_application/features/home/contacts/data/model/contact_model.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class ContactServices {
  Dio dio = GetIt.I.get<Dio>(instanceName: "auth");

  Future<ContactModel> getContacts() async {
    final response = await dio.get(UrlConst.user);
    return ContactModel.fromJson(response.data);
  }
}
