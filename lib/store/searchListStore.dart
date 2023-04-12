import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


class SearchListStore extends ChangeNotifier {
  var searchList = [];
  var detailItem;
  String category = 'c1';
  var dio = Dio();

  refreshItem(index) {
    detailItem = searchList[index];
    print(detailItem);
    notifyListeners();
  }

  changeCategory(cd) {
    category = cd;
    notifyListeners();
    getList();
  }


  getList() async {
    try{
      var params = {'locale' : 'kr','category' : category, 'page' : '2'};
      var response = await dio.get('${dotenv.env['BASE_URL']}', queryParameters: params);
      // var response = await http.get(Uri.parse('${dotenv.env['BASE_URL']}'));
      if(response.statusCode == 200){
        searchList = response.data['items'];
        notifyListeners();
        print(searchList);
      }
    }catch(e){
      print(e);
    }
  }
}