import 'package:flutter/material.dart';

// ページ
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  // ページを示す。Stateオブジェクトを持ち。Stateオブジェクトは外観に影響を与える。

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// 状態
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // setStateの呼び出しで変更をFlutterに伝え、buildを再実行する。
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ページを示すオブジェクトから値を取得する。
        title: Text(widget.title),
      ),
      body: Center(
        // レイアウトウィジェット、子供の縦と横でセンターに配置する。
        child: Column(
          // Columnは自身のサイズや子ウィジェットの位置を制御できる。
          // mainAxisAlignmentを使って垂直位置をセンタリングする。
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}