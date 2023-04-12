import 'package:flutter/material.dart';
import 'package:jejuinfo/pages/itemDetail.dart';
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
    return ListView.builder(
        itemCount: context.watch<SearchListStore>().searchList.length,
        itemBuilder: (context, i){
          var allTag = context.watch<SearchListStore>().searchList[i]['alltag'].split(',');
          var newTag;
          if(allTag.length > 4){
            allTag = allTag.sublist(0, 3);
          }

          for(String tag in allTag){
            newTag = '${newTag??''}' + '#${tag} ';
          }

          return
            GestureDetector(
              onTap: (){
                context.read<SearchListStore>().refreshItem(i);
                Navigator.push(context,
                    PageRouteBuilder(pageBuilder: (c, a1, a2) => ItemDetail(index : i),
                        transitionsBuilder: (c, a1, a2, child) =>
                            FadeTransition(opacity: a1, child: child,)
                    )
                );

              },
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color.fromRGBO(225, 225, 225, 0.7), width: 0.5),
                  ),
                ),
                child: ListTile(
                  visualDensity: VisualDensity(vertical: 4),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 80,
                      height: 120,
                      child: Image.network(context.watch<SearchListStore>().searchList[i]['repPhoto']['photoid']['thumbnailpath'], fit: BoxFit.cover,),
                    )
                  ),
                  title: Text('${context.watch<SearchListStore>().searchList[i]['title']}'),
                  subtitle: Text(newTag),
          ),
              ),
            );
    });
  }
}

