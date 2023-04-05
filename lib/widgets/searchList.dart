import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:jejuinfo/store/searchListStore.dart';
import 'package:provider/provider.dart';


class SearchList extends StatefulWidget {
  const SearchList({Key? key}) : super(key: key);

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {


  @override
  void initState() {
    super.initState();
    context.read<SearchListStore>().getList();
  }
  @override
  Widget build(BuildContext context) {
    return Text('asda');
  }
}
