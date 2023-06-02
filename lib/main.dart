import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test3/f011_router.gr.dart';

// アプリケーションエントリポイント
void main() {
  runApp(const FlutterTest3App());
}

// Auto Routeのツールで自動生成したクラス
final _appRouter = AppRouter();

// アプリ
class FlutterTest3App extends StatelessWidget {
  const FlutterTest3App({super.key});

  // アプリケーションルート
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
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
      // Auto Routeに必要な拡張
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}