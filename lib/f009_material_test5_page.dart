import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'f005_app_common.dart';

class MaterialTest5Page extends HookWidget {
  const MaterialTest5Page({super.key, required this.heroTag});
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    final counter = useState(0);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          child: Text('ドロワーを開く ${counter.value}'),
          onPressed: () {
            AppCommon().materialHomePageScaffoldKey.currentState!
                .openEndDrawer();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: heroTag,
        onPressed: () {
          counter.value++;
        },
        tooltip: 'インクリメント',
        child: const Icon(Icons.add),
      ),
    );
  }
}