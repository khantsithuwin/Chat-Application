import 'package:chat_application/common/storage/app_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

typedef ThemeProvider = NotifierProvider<ThemeNotifier, ThemeStateModel>;

class ThemeStateModel {
  final bool isDark;

  ThemeStateModel({required this.isDark});

  ThemeStateModel copyWith({bool? isDark}) {
    return ThemeStateModel(isDark: isDark ?? this.isDark);
  }
}

class ThemeNotifier extends Notifier<ThemeStateModel> {
  final AppStorage _appStorage = GetIt.I.get<AppStorage>();

  @override
  ThemeStateModel build() {
    bool isDark = _appStorage.getTheme();
    return ThemeStateModel(isDark: isDark);
  }

  void changeTheme(bool isDark) {
    _appStorage.saveTheme(isDark);
    state = state.copyWith(isDark: isDark);
  }
}
