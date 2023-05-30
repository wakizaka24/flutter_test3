import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MaterialTest5Page extends HookWidget {
  const MaterialTest5Page({super.key, required this.heroTag});
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    final counter1 = useState(0);
    final counter2 = useState(0);

    return Scaffold(
      body: ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.only(
            left: 16,
            top: 16,
            right: 16,
            bottom: 16,
          ),
          children: [
            Text('◎ 本人 ${counter1.value}',
                style: const TextStyle(fontSize: 15)),
            Container(height: 32),
            Text('兄弟1 現在時刻 ${DateTime.now()}',
                style: const TextStyle(fontSize: 15)),
            Container(height: 32),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('兄弟2の子1 現在時刻 ${DateTime.now()}',
                    style: const TextStyle(fontSize: 15)),
                Text('兄弟2の子2 ${counter2.value} 現在時刻 ${DateTime.now()}',
                    style: const TextStyle(fontSize: 15)),
                Container(height: 5),
                ElevatedButton(
                  onPressed: () {
                    counter2.value++;
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            Container(height: 32),
            const MaterialTest5Widget()
          ]
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: heroTag,
        onPressed: () {
          counter1.value++;
        },
        tooltip: 'インクリメント',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MaterialTest5Widget extends HookWidget {
  const MaterialTest5Widget({super.key});

  @override
  Widget build(BuildContext context) {
    final counter3 = useState(0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('兄弟3の子1 Widgetの切り出し'),
        Text('兄弟3の子2 現在時刻 ${DateTime.now()}',
            style: const TextStyle(fontSize: 15)),
        Text('兄弟3の子3 ${counter3.value} 現在時刻 ${DateTime.now()}',
            style: const TextStyle(fontSize: 15)),
        Container(height: 5),
        ElevatedButton(
          onPressed: () {
            counter3.value++;
          },
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
