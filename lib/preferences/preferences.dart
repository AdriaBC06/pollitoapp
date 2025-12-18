import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static String _nom = "";
  static int _pios = 0;

  static Future init() async{
    _prefs = await SharedPreferences.getInstance();
  }

  static String get nom{
    return _prefs.getString("nom") ?? _nom;
  }

  static set nom(String nom){
    _nom = nom;
    _prefs.setString("nom", nom);
  }

  static int get pios{
    return _prefs.getInt("pios") ?? _pios;
  }

  static set pios(int pios){
    _pios = pios;
    _prefs.setInt("pios", pios);
  }
}