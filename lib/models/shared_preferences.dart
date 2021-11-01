import 'user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  // checking authToken
  static Future<AppUser> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("authToken");
    AppUser user = AppUser(authToken: token);
    return user;
  }

// set AuthToken once user login completed
  static Future<bool> setToken(String authToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("authToken", authToken);
    return true;
  }
}
