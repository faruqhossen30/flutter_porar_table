import 'dart:convert';

import 'package:flutter_porar_table/const/http_error_handaller.dart';
import 'package:flutter_porar_table/view/user/bottom_navigationbar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  String baseURL = 'https://binaryseotools.com/api';

  void registerUser({required String mobile, required String name, required String password}) async {
    try {
      Map<String, dynamic> bodyMap = {
        'name': name,
        'mobile': mobile,
        'password': password,
      };

      http.Response response =
          await http.post(Uri.parse('${baseURL}/register'), body: bodyMap);

      var rawData = jsonDecode(response.body.toString());
      print(rawData);

      httpResponseHandaller(response: response, onSucess: () async{
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("token", rawData['token']);
        print(rawData['token']);
        Fluttertoast.showToast(msg: rawData['message']);
        Get.to(()=>BottomNavigationbarScreen());
      });

    } catch (err) {
      Fluttertoast.showToast(msg: err.toString());
    }
  }

  void loginUser({required mobile, required password}) async{
    try {
      Map<String, dynamic> bodyMap = {
        'mobile': mobile,
        'password': password,
      };

      http.Response response =
          await http.post(Uri.parse('${baseURL}/login'), body: bodyMap);

      var rawData = jsonDecode(response.body.toString());
      print(rawData);

      httpResponseHandaller(response: response, onSucess: () async{
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("token", rawData['token']);
        print(rawData['token']);

        Fluttertoast.showToast(msg: rawData['message']);
        Get.to(()=>BottomNavigationbarScreen());
      });


    } catch (err) {
      Fluttertoast.showToast(msg: err.toString());
    }
  }
}
