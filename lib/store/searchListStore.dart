import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';




class SearchListStore extends ChangeNotifier {
  var searchList = [];
  var dio = Dio();


  getList() async {
    try{
      var params = {'locale' : 'kr','category' : 'c4', 'page' : '2'};
      var response = await dio.get('${dotenv.env['BASE_URL']}', queryParameters: params);
      // var response = await http.get(Uri.parse('${dotenv.env['BASE_URL']}'));
      if(response.statusCode == 200){
        searchList = response.data['items'];
        notifyListeners();
      }
    }catch(e){
      print(e);
    }

  }
}