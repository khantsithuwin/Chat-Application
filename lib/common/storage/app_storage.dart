import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  final String _tokenKey = "token";
  final String _userIdKey = "userId";
  final String _theme = "theme";
  final String _userName = "userName";

  final SharedPreferences _sharedPreferences = GetIt.I.get<SharedPreferences>();

  Future<void> saveToken(String token) async {
    await _sharedPreferences.setString(_tokenKey, token);
  }

  String getToken() {
    return _sharedPreferences.getString(_tokenKey) ?? "";
  }

  Future<void> saveUserId(String id) async {
    await _sharedPreferences.setString(_userIdKey, id);
  }

  String getUserId() {
    return _sharedPreferences.getString(_userIdKey) ?? "";
  }

  Future<void> saveUserName(String name) async {
    await _sharedPreferences.setString(_userName, name);
  }

  String getUserName() {
    return _sharedPreferences.getString(_userName) ?? "";
  }

  Future<void> saveTheme(bool isDark) async {
    await _sharedPreferences.setBool(_theme, isDark);
  }

  bool getTheme() {
    return _sharedPreferences.getBool(_theme) ?? false;
  }

  Future<void> logout() async {
    await _sharedPreferences.clear();
  }
}
