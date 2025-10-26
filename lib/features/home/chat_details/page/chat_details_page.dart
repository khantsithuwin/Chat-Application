import 'package:chat_application/common/storage/app_storage.dart';
import 'package:chat_application/common/theme/extension/color_brand.dart';
import 'package:chat_application/common/theme/extension/color_neutral.dart';
import 'package:chat_application/features/home/chat_details/data/models/message_model.dart';
import 'package:chat_application/features/home/chat_details/data/notifier/chat_detail_state_notifier.dart';
import 'package:chat_application/features/home/contacts/data/model/contact_model.dart';
import 'package:chat_application/features/home/contacts/data/model/create_chat_model.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../data/notifier/chat_detail_state_model.dart';

class ChatDetailsPage extends ConsumerStatefulWidget {
  const ChatDetailsPage({super.key});

  @override
  ConsumerState<ChatDetailsPage> createState() => _ChatDetailsPageState();
}

class _ChatDetailsPageState extends ConsumerState<ChatDetailsPage> {
  final AppStorage _appStorage = GetIt.I.get<AppStorage>();
  Users? _otherUser;
  String? _myId;
  final TextEditingController _controller = TextEditingController();
  final ChatDetailProvider _provider = ChatDetailProvider(
    () => ChatDetailStateNotifier(),
  );

  CreateChatModel? _createChatModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      GoRouterState state = GoRouterState.of(context);
      CreateChatModel? model = state.extra as CreateChatModel?;
      _createChatModel = model;
      _myId = _appStorage.getUserId();
      _getOtherUser(model);
      String? id = model?.data?.id;

      if (id != null) {
        ref.read(_provider.notifier).getAllMessage(chatId: id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    ColorBrand colorBrand = Theme.of(context).extension<ColorBrand>()!;
    TextTheme textTheme = TextTheme.of(context);
    ColorNeutral colorNeutral = Theme.of(context).extension<ColorNeutral>()!;

    ChatDetailStateModel stateModel = ref.watch(_provider);
    bool isLoading = stateModel.isLoading;
    bool isSuccess = stateModel.isSuccess;
    bool isFailed = stateModel.isFailed;

    MessageModel messageModel = stateModel.messageModel;
    List<MessageData> message = messageModel.data ?? [];

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(title: Text(_otherUser?.name ?? ".......")),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isLoading) Center(child: CircularProgressIndicator()),
                if (isFailed) Center(child: Text("Try Again")),
                if (isSuccess)
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.all(8.0),
                      reverse: true,
                      itemCount: message.length,
                      itemBuilder: (context, index) {
                        MessageData data = message[index];
                        String? senderId = data.sender?.id;
                        bool ownMessage = senderId == _myId;
                        return BubbleSpecialThree(
                          text: data.content ?? "",
                          tail: ownMessage,
                          isSender: ownMessage,
                          color: ownMessage
                              ? colorBrand.brandDefault
                              : colorScheme.surfaceContainerLow,
                          textStyle: textTheme.bodyMedium!.copyWith(
                            color: ownMessage
                                ? colorNeutral.buttonText
                                : colorScheme.onSurface,
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
          _chatTextBox(),
        ],
      ),
    );
  }

  void _getOtherUser(CreateChatModel? model) {
    List<Users> users = model?.data?.users ?? [];

    if (users.isNotEmpty && users.length == 2) {
      Users otherUser = users.firstWhere((e) => e.id != _myId);
      setState(() {
        _otherUser = otherUser;
      });
    }
  }

  Widget _chatTextBox() {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    ColorBrand colorBrand = Theme.of(context).extension<ColorBrand>()!;
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 16.0),
            child: TextField(
              controller: _controller,
              onChanged: (_) {
                setState(() {});
              },
              decoration: InputDecoration(
                fillColor: colorScheme.surfaceContainerHighest,
                filled: true,
                hintText: "Email",
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        IconButton(
          color: colorBrand.brandDefault,
          onPressed: _controller.text.trim().isEmpty ? null : _sendMessage,
          icon: Icon(Icons.send_sharp),
        ),
      ],
    );
  }

  void _sendMessage() async {
    try {
      String? id = _createChatModel?.data?.id;
      if (id != null) {
        ref
            .read(_provider.notifier)
            .sendMessage(chatId: id, content: _controller.text);
      }
      _controller.clear();
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Failed to sent!")));
    }
  }
}
