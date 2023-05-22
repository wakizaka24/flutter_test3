import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test3/f002_material_home_page.dart';

// アプリケーションエントリポイント
void main() {
  runApp(const FlutterTest3App());
}

// アプリ
class FlutterTest3App extends StatelessWidget {
  const FlutterTest3App({super.key});

  // アプリケーションルート
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("en"),
        Locale("ja"),
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MaterialHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}