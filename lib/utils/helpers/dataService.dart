import 'package:shared_preferences/shared_preferences.dart';

class DataService{
  static late SharedPreferences sharedPreferences;


  static init()async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static dynamic setData({required String key, required dynamic value})async{
    if(value is double){
      sharedPreferences.setDouble(key, value);
    }
    else if(value is int){
      sharedPreferences.setInt(key, value);
    }
    else if(value is bool){
      sharedPreferences.setBool(key, value);
    }
    else{
      sharedPreferences.setString(key, value);
    }
  }

  static dynamic getData({required String key})async{
    return sharedPreferences.get(key);
  }

  static Future<bool> removeData({required String key})async{
     return await sharedPreferences.remove(key);
  }
}