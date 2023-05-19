import 'package:flutter/material.dart';
import 'package:flutter_test3/P001_auto_route/router.gr.dart';

void main() {
  runApp(const FlutterTest3App());
}

// Auto Routeのツールで自動生成したクラス
final _appRouter = AppRouter();

class FlutterTest3App extends StatelessWidget {
  const FlutterTest3App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Auto Route Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      // Auto Routeに必要な拡張
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}