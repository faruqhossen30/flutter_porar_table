import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

void httpResponseHandaller({required http.Response response, required VoidCallback onSucess}){

  switch(response.statusCode){
    case 200:
      onSucess();
      break;
    case 422:
      var rawData = jsonDecode(response.body.toString());

      Fluttertoast.showToast(msg: rawData['mobile']);
      break;
  }

}