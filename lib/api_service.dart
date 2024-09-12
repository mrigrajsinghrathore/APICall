import 'dart:convert';

import 'package:api_for_list/api_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<PostWithModel>?> getPostWithModel() async {
    try{
      var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      if(response.statusCode == 200){
        List<PostWithModel> model = List<PostWithModel>.from(json.decode(response.body).map((x)=> PostWithModel.fromJson(x)));
        return model;
      }
    }catch(e){
      print(e.toString());
      print("nahi ho raha");
    }
  }
}