import 'package:chat_application/features/home/contacts/data/model/create_chat_model.dart';
import 'package:chat_application/features/home/contacts/data/notifiers/contact_state_model.dart';
import 'package:chat_application/features/home/contacts/data/services/contact_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/contact_model.dart';

typedef ContactProvider =
    NotifierProvider<ContactStateNotifier, ContactStateModel>;

class ContactStateNotifier extends Notifier<ContactStateModel> {
  final ContactServices _contactServices = ContactServices();

  @override
  ContactStateModel build() {
    return ContactStateModel(
      isLoading: false,
      isSuccess: false,
      isFailed: false,
      contactModel: null,
      errorMessage: "",
    );
  }

  void getContact({String search = ""}) async {
    try {
      state = state.copyWith(
        isLoading: true,
        isFailed: false,
        isSuccess: false,
      );
      ContactModel model = await _contactServices.getContacts(search: search);
      state = state.copyWith(
        isSuccess: true,
        isFailed: false,
        isLoading: false,
        contactModel: model,
      );
    } catch (e) {
      if (e is DioException && e.response?.data["message"] != null) {
        state = state.copyWith(
          isLoading: false,
          isSuccess: false,
          isFailed: true,
          errorMessage: e.response?.data['message'],
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          isSuccess: false,
          isFailed: true,
          errorMessage: "Something wrong",
        );
      }
    }
  }

  Future<CreateChatModel> createChat({required String userId}) async {
    try {
      CreateChatModel chatModel = await _contactServices.createChat(
        userId: userId,
      );
      return chatModel;
    } catch (e) {
      return Future.error(e);
    }
  }
}
