import 'package:shared_preferences/shared_preferences.dart';

class SharedData{
   static String key = "MEMEKEY";
  static Future<bool>saveData(int value) async {
    final inst = await SharedPreferences.getInstance();
    return await inst.setInt(key, value);
  }
   static Future<int?> fetchData() async{
    final inst = await SharedPreferences.getInstance();
    return inst.getInt(key);
   }
}