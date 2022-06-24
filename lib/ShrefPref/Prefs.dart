
import 'package:shared_preferences/shared_preferences.dart';

class Prefs
{
  static Future setPref(String value)async
  {
    final pref=await SharedPreferences.getInstance();
    pref.setString("mpass", value);
  }
  static Future<String> getPref()async
  {
    final pref=await SharedPreferences.getInstance();
    return pref.getString("mpass") ?? '';
  }
}