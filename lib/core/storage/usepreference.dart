import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const _keySelectedValue = 'selected_value';
  static const _keyToken = 'token';

  // Save the selected value to shared preferences
  static Future<void> setSelectedValue(int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_keySelectedValue, value);
    int? storedValue = await UserPreferences.getSelectedValue();
    print('Stored Selected Value: $storedValue ************');
  }

  // Get the selected value from shared preferences
  static Future<int?> getSelectedValue() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_keySelectedValue);
  }

  // Save the token to shared preferences
  static Future<void> setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyToken, token);
    String? storedToken = await UserPreferences.getToken();
    print('Stored Token: $storedToken ###################');
  }

  // Get the token from shared preferences
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyToken);
  }

  // Clear all shared preferences
  static Future<void> clearPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    print('All shared preferences cleared.');
  }
}
