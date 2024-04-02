import 'dart:convert';
import 'package:deneme2/users/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RememberUserPrefs {
  //save-remember User-info
  static Future<void> saveRememberUser(User userInfo) async { // userinfo yerine userInfo olarak düzeltilmiştir
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userJsonData = jsonEncode(userInfo.toJson());
    await preferences.setString("currentUser", userJsonData);
  }
}