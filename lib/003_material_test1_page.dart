import 'package:flutter/material.dart';

// ページ
// Stateオブジェクトを持ち。Stateオブジェクトは外観に影響を与える。
class MaterialTest1Page extends StatefulWidget {
  const MaterialTest1Page({super.key, required this.title});
  final String title;

  @override
  State<MaterialTest1Page> createState() => _MaterialTest1PageState();
}

// 状態
class _MaterialTest1PageState extends State<MaterialTest1Page>
    with AutomaticKeepAliveClientMixin {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: Text('StatelessUserPageへ $_counter'),
              onPressed: () {
                // context.router.push(MaterialUserRoute(name: 'Ryota'))
              },
            ),
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // setStateの呼び出しで変更をFlutterに伝え、buildを再実行する。
            _counter++;
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  // AutomaticKeepAliveClientMixinを拡張することで、
  // タブバーで値を保持することができる。
  @override
  bool get wantKeepAlive => true;
}