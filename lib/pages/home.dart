import 'package:flutter/material.dart';
import 'package:jejuinfo/widgets/searchList.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jeju Info'),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.my_library_add))],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(5, 30, 5, 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (){},
                  child: Column(
                    children: [
                      Text('관광지', style: TextStyle(fontSize: 20)),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                        height: 2,
                        width: 50,
                        color: Colors.orange,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){},
                  child: Column(
                    children: [
                      Text('쇼핑', style: TextStyle(fontSize: 20)),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                        height: 2,
                        width: 50,
                        color: Colors.orange,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){},
                  child: Column(
                    children: [
                      Text('숙박', style: TextStyle(fontSize: 20)),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                        height: 2,
                        width: 50,
                        color: Colors.orange,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text('음식점', style: TextStyle(fontSize: 20)),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      height: 2,
                      width: 50,
                      color: Colors.orange,
                    ),
                  ],
                ),
              ],
            ),
            // 상단 카테고리 영역
            SizedBox(
              height: 15,
          ),
            Expanded(child: SearchList())
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.star), label: '#'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: '3'),
        ],
      ),
    );
  }
}

