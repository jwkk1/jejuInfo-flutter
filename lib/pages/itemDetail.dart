import 'package:flutter/material.dart';
import 'package:jejuinfo/store/searchListStore.dart';
import 'package:jejuinfo/widgets/naverMap.dart';
import 'package:provider/provider.dart';


class ItemDetail extends StatefulWidget {
  const ItemDetail({Key? key, this.index}) : super(key: key);
  final index;

  @override
  State<ItemDetail> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${context.watch<SearchListStore>().searchList[widget.index]['title']}'),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: FNMapPage(),
            ),
          ),
        ],
      ),
    );
  }
}
