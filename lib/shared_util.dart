import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceUtils {
  static final SharedPreferenceUtils _instance = SharedPreferenceUtils._internal();

  factory SharedPreferenceUtils() {
    return _instance;
  }

  SharedPreferenceUtils._internal();

  static String get textSave => 'textSave';

  ///Authentication Section
  Future<String?> getText() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(textSave);
  }

  Future<bool> saveText({required String text}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(textSave, text);
  }

  Future<bool> deleteText() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.remove(textSave);
  }
}
