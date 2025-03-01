import 'package:shared_preferences/shared_preferences.dart';

class Preferences{
  static late SharedPreferences prefs;

  static Future<void> iniMemory() async {
    prefs = await SharedPreferences.getInstance();
  }

  static setLanguage(){
    String? language=prefs.getString("language");
    if(language=="hn"){
      prefs.setString("language", "en");
    }else{
      prefs.setString("language", "hn");
    }
  }
  static String getLanguage(){
    return prefs.getString('language')??"en";
  }

  static getCountryCode(){
    if(getLanguage()=="hn"){
      return "IN";
    }else{
      return "US";
    }
  }

}