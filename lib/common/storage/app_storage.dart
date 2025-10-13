import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  final String _tokenKey = "token";
  final String _userIdKey = "userId";
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
}
