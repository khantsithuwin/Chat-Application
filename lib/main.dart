import 'package:chat_application/common/routes/routes.dart';
import 'package:chat_application/common/theme/theme_const.dart';
import 'package:chat_application/common/theme/theme_notifier.dart';
import 'package:chat_application/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.top],
  );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  final ThemeProvider _provider = GetIt.I.get<ThemeProvider>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeStateModel model = ref.watch(_provider);
    bool isDark = model.isDark;
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeConst.lightTheme(),
      darkTheme: ThemeConst.darkTheme(),
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      routerConfig: router,
    );
  }
}
