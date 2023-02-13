import 'package:shared_preferences/shared_preferences.dart';

class SaveAccount {
    final prefs = SharedPreferences.getInstance();


 saveAccount(String rol) async {
    prefs.then((value) => value.setBool("saveAccount", true) );
    prefs.then((value) => value.setString("rol", rol));
    
  }

  deleteSaveAccount(){
    prefs.then((value) => value.remove("saveAccount"));
    prefs.then((value) => value.remove("rool"));
  }

  Future<bool?> getSaveAccount()async{
    final response = await prefs;
    final result =  response.getBool("saveAccount");
    return result;
  }

  Future<String> getSaveTypeRol() async {
    final response = await prefs;
    final result  = response.getString("rol");
    return result!;
  }
}