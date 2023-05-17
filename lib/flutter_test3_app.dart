import 'package:flutter/material.dart';
import 'package:flutter_test3/my_home_page.dart';

// アプリ
class FlutterTest3App extends StatelessWidget {
  const FlutterTest3App({super.key});

  // アプリケーションルートを示す。
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}