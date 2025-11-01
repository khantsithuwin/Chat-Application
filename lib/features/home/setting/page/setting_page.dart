import 'package:chat_application/common/theme/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

class SettingPage extends ConsumerStatefulWidget {
  const SettingPage({super.key});

  @override
  ConsumerState<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends ConsumerState<SettingPage> {
  final ThemeProvider _provider = GetIt.I.get<ThemeProvider>();

  @override
  Widget build(BuildContext context) {
    bool isDark = ref.watch(_provider).isDark;

    ThemeNotifier notifier = ref.read(_provider.notifier);

    return Column(
      children: [
        SwitchListTile(
          title: Text("Dark Mode"),
          value: isDark,
          onChanged: (bool isDark) {
            notifier.changeTheme(isDark);
          },
        ),
      ],
    );
  }
}
