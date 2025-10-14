import 'package:chat_application/features/home/contacts/data/model/contact_model.dart';
import 'package:chat_application/features/home/contacts/data/notifiers/contact_state_model.dart';
import 'package:chat_application/features/home/contacts/data/notifiers/contact_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    ContactStateModel model = ref.watch(_provider);
    ContactStateNotifier notifier = ref.read(_provider.notifier);

    bool isLoading = model.isLoading;
    bool isSuccess = model.isSuccess;
    bool isFailed = model.isFailed;

    ContactModel? contactModel = model.contactModel;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isLoading) Center(child: CircularProgressIndicator()),
        if (isFailed)
          Center(
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
        if (isSuccess)
          Expanded(
            child: ListView.builder(
              itemCount: contactModel?.data?.length ?? 0,
              itemBuilder: (context, index) {
                Data? contact = contactModel?.data?[index];
                return Text(contact?.name ?? "");
              },
            ),
          ),
      ],
    );
  }
}
