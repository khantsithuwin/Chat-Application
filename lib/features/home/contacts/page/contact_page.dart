import 'package:chat_application/common/theme/extension/color_neutral.dart';
import 'package:chat_application/common/theme/extension/meta_data_text_theme.dart';
import 'package:chat_application/features/home/contacts/data/model/contact_model.dart';
import 'package:chat_application/features/home/contacts/data/model/create_chat_model.dart';
import 'package:chat_application/features/home/contacts/data/notifiers/contact_state_model.dart';
import 'package:chat_application/features/home/contacts/data/notifiers/contact_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ContactPage extends ConsumerStatefulWidget {
  const ContactPage({super.key});

  @override
  ConsumerState<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends ConsumerState<ContactPage> {
  final ContactProvider _provider = ContactProvider(() {
    return ContactStateNotifier();
  });

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(_provider.notifier).getContact();
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    MetaDataTextTheme metaDataTextTheme = Theme.of(
      context,
    ).extension<MetaDataTextTheme>()!;
    ColorNeutral colorNeutral = Theme.of(context).extension<ColorNeutral>()!;

    ContactStateModel model = ref.watch(_provider);
    ContactStateNotifier notifier = ref.read(_provider.notifier);

    bool isLoading = model.isLoading;
    bool isSuccess = model.isSuccess;
    bool isFailed = model.isFailed;

    ContactModel? contactModel = model.contactModel;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextFormField(
            style: textTheme.bodyLarge?.copyWith(color: colorScheme.onSurface),
            decoration: InputDecoration(
              icon: Icon(Icons.search),
              fillColor: colorScheme.surfaceContainerHighest,
              filled: true,
              hintText: "Search",
              border: InputBorder.none,
            ),
            onChanged: (String name) {
              if (name.trim().isEmpty) {
                notifier.getContact();
              } else {
                notifier.getContact(search: name);
              }
            },
          ),
        ),
        if (isLoading)
          Expanded(child: Center(child: CircularProgressIndicator())),
        if (isFailed)
          Expanded(
            child: Center(
              child: Column(
                children: [
                  Text(model.errorMessage),
                  OutlinedButton(
                    onPressed: () {
                      notifier.getContact();
                    },
                    child: Text("Try Again"),
                  ),
                ],
              ),
            ),
          ),
        if (isSuccess)
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: contactModel?.data?.length ?? 0,
              itemBuilder: (context, index) {
                Data? contact = contactModel?.data?[index];
                return InkWell(
                  onTap: () async {
                    _createChat(contact);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            contact?.name ?? "",
                            style: textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onSurface,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            contact?.email ?? '',
                            style: metaDataTextTheme.metaData1.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Divider(color: colorNeutral.neutralLine),
                        ],
                      ),
                      if (contact?.isVerified == true)
                        Tooltip(
                          message: "This account is already verified",
                          child: Icon(Icons.verified, color: Colors.green),
                        ),
                      if (contact?.isVerified != true)
                        Tooltip(
                          message: "This account is not verified",
                          child: Icon(Icons.warning, color: Colors.yellow),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
      ],
    );
  }

  void _createChat(Data? contact) async {
    showDialog(
      useRootNavigator: false,
      context: context,
      builder: (contact) {
        return Center(child: CircularProgressIndicator());
      },
    );
    try {
      ContactStateNotifier notifier = ref.read(_provider.notifier);
      CreateChatModel createChat = await notifier.createChat(
        userId: contact?.id ?? "",
      );
      if (mounted) {
        context.push("/chat-detail", extra: createChat);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Create chat error")));
      }
    } finally {
      if (mounted) {
        Navigator.pop(context);
      }
    }
  }
}
