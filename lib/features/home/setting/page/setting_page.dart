import 'package:chat_application/common/storage/app_storage.dart';
import 'package:chat_application/common/theme/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class SettingPage extends ConsumerStatefulWidget {
  const SettingPage({super.key});

  @override
  ConsumerState<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends ConsumerState<SettingPage> {
  final ThemeProvider _provider = GetIt.I.get<ThemeProvider>();
  final AppStorage _appStorage = GetIt.I.get<AppStorage>();

  @override
  Widget build(BuildContext context) {
    bool isDark = ref.watch(_provider).isDark;

    ThemeNotifier notifier = ref.read(_provider.notifier);

    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.person_outline_rounded),
          title: Text(_appStorage.getUserName()),
        ),
        SwitchListTile(
          title: Text("Dark Mode"),
          value: isDark,
          onChanged: (bool isDark) {
            notifier.changeTheme(isDark);
          },
        ),
        ListTile(
          onTap: () async {
            await _appStorage.logout();
            if (context.mounted) {
              context.go("/login");
            }
          },
          title: Text("LogOut"),
          trailing: Icon(Icons.login_outlined),
        ),
      ],
    );
  }
}
