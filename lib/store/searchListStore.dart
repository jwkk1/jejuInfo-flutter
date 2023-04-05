import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';


class SearchListStore extends ChangeNotifier {
  var searchList = [];


  getList() async {
    try{
      var result = await http.get(Uri.parse('${dotenv.env['BASE_URL']}'));
      var result2 = jsonDecode(result.body);
      searchList = result2['items'];
      notifyListeners();
    }catch(e){
      print(e);
    }

  }
}