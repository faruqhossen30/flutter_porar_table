import 'dart:convert';
import 'package:flutter_porar_table/const/const.dart';
import 'package:flutter_porar_table/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileService {
  Future<UserModel> userInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var authToken = await prefs.getString("token");

    http.Response response = await http.get(
      Uri.parse("${baseURL}/user"),
      headers: {'Authorization': 'Bearer ${authToken}'},
    );
    var rawData = jsonDecode(response.body);
    return UserModel.fromJson(rawData);
    print(rawData.toString());

    // if(response.statusCode == 200){
    //   var rawData = jsonDecode(response.body);
    //   return UserModel.fromJson(rawData);
    //   print(rawData.toString());
    // }else{
    //   return "somethis went wrong !";
    // }

  }
}
