import 'package:flutter/material.dart';
import 'package:flutter_test3/f005_app_common.dart';

class MaterialTest3Page extends StatefulWidget {
  const MaterialTest3Page({super.key, required this.heroTag});
  final String heroTag;

  @override
  State<MaterialTest3Page> createState() => _MaterialTest3PageState();
}

class _MaterialTest3PageState extends State<MaterialTest3Page>
    with AutomaticKeepAliveClientMixin {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(
              150,
              32,
            ),
            textStyle: const TextStyle(fontSize: 13),
            padding: const EdgeInsets.all(0),
          ),
          child: Text('ドロワーを開く $_counter'),
          onPressed: () {
            AppCommon().materialHomePageScaffoldKey.currentState!
                .openEndDrawer();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: widget.heroTag,
        onPressed: () {
          setState(() {
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