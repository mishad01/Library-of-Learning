import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static String? accessToken;

  static final String _accessTokenKey = 'access-token';

  static Future<void> saveAccessToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_accessTokenKey, token);
    accessToken = token;
  }

  static Future<String?> getAccessToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String? token = sharedPreferences.getString(_accessTokenKey);
    accessToken = token;
    return token;
  }

  bool isLoggedInUser() {
    return accessToken != null;
  }

  Future<void> clearUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

  static Future<bool> checkAuthState() async {
    String? token = await getAccessToken();
    if (accessToken == null) return false;
    accessToken = token;
    return true;
  }
}
