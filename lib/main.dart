import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'f001_material_home_page.dart';

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
    // Riverpodに必要な拡張
    return ProviderScope(
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('ja'),
        ],
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const MaterialHomePage(),
      ),
    );
  }
}