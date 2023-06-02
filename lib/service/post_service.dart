import 'dart:convert';

import 'package:flutter_porar_table/model/post_model.dart';
import 'package:http/http.dart' as http;

class PostService{
  String baseURL = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<PostModel>> getPost()async{

    List<PostModel> _post = [];
        http.Response response = await http.get(Uri.parse(baseURL));

        final rawData = jsonDecode(response.body);
        if(response.statusCode == 200){
          print(rawData);
          for(var i in rawData){
            _post.add(PostModel.fromJson(i));
          }

          return _post;

        }else{
          return [];
        }
  }



}