import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/utils/constants.dart';

class LocalStorageService extends GetxService {
  late SharedPreferences _prefs;

  Future<LocalStorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  // User Data
  Future<bool> setUserData(Map<String, dynamic> userData) {
    return _prefs.setString(AppConstants.userDataKey, userData.toString());
  }

  Map<String, dynamic>? getUserData() {
    final data = _prefs.getString(AppConstants.userDataKey);
    if (data != null) {
      // Parse string back to Map
      // In real app, use json.encode/decode
      return {}; // Placeholder
    }
    return null;
  }

  Future<bool> clearUserData() {
    return _prefs.remove(AppConstants.userDataKey);
  }

  // Token
  Future<bool> setToken(String token) {
    return _prefs.setString(AppConstants.userTokenKey, token);
  }

  String? getToken() {
    return _prefs.getString(AppConstants.userTokenKey);
  }

  // Generic methods
  Future<bool> setString(String key, String value) {
    return _prefs.setString(key, value);
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }

  Future<bool> setBool(String key, bool value) {
    return _prefs.setBool(key, value);
  }

  bool? getBool(String key) {
    return _prefs.getBool(key);
  }
}
