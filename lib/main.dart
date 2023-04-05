import 'package:flutter/material.dart';
import 'package:jejuinfo/pages/home.dart';
import 'package:jejuinfo/store/searchListStore.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async{
  await dotenv.load(fileName: 'assets/config/.env');

  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (c) => SearchListStore()),
      ],
        child: MaterialApp(
            home: MyApp()
        ),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Home();
  }
}
