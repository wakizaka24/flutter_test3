import 'package:flutter/material.dart';

class MaterialTest2Page extends StatefulWidget {
  const MaterialTest2Page({super.key, required this.title});
  final String title;

  @override
  State<MaterialTest2Page> createState() => _MaterialTest2PageState();
}

class _MaterialTest2PageState extends State<MaterialTest2Page>
    with AutomaticKeepAliveClientMixin {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          child: Text('UserPageへ $_counter'),
          onPressed: () {
            // context.router.push(MaterialUserRoute(name: 'Ryota'))
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // setStateの呼び出しで変更をFlutterに伝え、buildを再実行する。
            _counter++;
          });
        },
        tooltip: 'インクリメント',
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}