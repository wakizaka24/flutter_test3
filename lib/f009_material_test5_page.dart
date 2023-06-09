import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_test3/f005_app_common.dart';
import 'package:flutter_test3/f010_material_test6_page.dart';

class MaterialTest5Page extends HookWidget {
  const MaterialTest5Page({super.key, required this.heroTag});
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    // build内で使用する必要はあるがコールバック関数を使用することで、
    // 処理をWidget(View)と分離する。
    final context = useContext();
    final counter1 = useState(0);
    final counter2 = useState(0);
    final showMessageDialogType001 = useShowMessageDialogType001();
    final showMessageDialogType002 = useShowMessageDialogType002();
    final isMounted = useIsMounted();
    final showMessageDialogType003 = useShowMessageDialogType003();

    // Flutter Hooksの検証 useEffect
    useEffect(() {
      debugPrint('MaterialTest5Pageの初期化処理');
      return () {
        debugPrint('MaterialTest5Pageの解放処理');
      };
    }, const []);

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
            Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(
                        150,
                        32,
                      ),
                      textStyle: const TextStyle(fontSize: 13),
                      padding: const EdgeInsets.all(0),
                    ),
                    child: const Text('Riverpodの検証へ'),
                    onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>
                            const MaterialTest6Page(title: 'Riverpodの検証')),
                      );
                    },
                  ),
                ]
            ),
            Container(height: 32),
            const Text('Flutter Hooksの検証 useState',
                style: TextStyle(fontSize: 15)),
            Container(height: 16),
            Text('◎ 本人 ${counter1.value}',
                style: const TextStyle(fontSize: 15)),
            Container(height: 16),
            Text('兄弟1 現在時刻 ${DateTime.now()}',
                style: const TextStyle(fontSize: 15)),
            Container(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('兄弟2の子1 現在時刻 ${DateTime.now()}',
                    style: const TextStyle(fontSize: 15)),
                Text('兄弟2の子2 ${counter2.value} 現在時刻 ${DateTime.now()}',
                    style: const TextStyle(fontSize: 15)),
                Container(height: 5),
                FloatingActionButton(
                  heroTag: "${heroTag}_2",
                  onPressed: () {
                    counter2.value++;
                  },
                  tooltip: 'インクリメント',
                  child: const Icon(Icons.add),
                )
              ],
            ),
            Container(height: 16),
            MaterialTest5Widget(heroTag: heroTag),
            Container(height: 32),
            const Text('Flutter Hooksの検証 useContext',
                style: TextStyle(fontSize: 15)),
            Container(height: 16),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    String? result = await showMessageDialogType001();
                    if (!isMounted()) return;
                    // ignore: use_build_context_synchronously
                    await showMessageDialogType002(result);
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(
                      52,
                      32,
                    ),
                    textStyle: const TextStyle(fontSize: 13),
                    padding: const EdgeInsets.all(0),
                  ),
                  child: const Text('開く1'),
                ),
                Container(width: 8),
                ElevatedButton(
                  onPressed: () async {
                    await showMessageDialogType003();
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(
                      52,
                      32,
                    ),
                    textStyle: const TextStyle(fontSize: 13),
                    padding: const EdgeInsets.all(0),
                  ),
                  child: const Text('開く2'),
                ),
              ],
            ),
          ]
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "${heroTag}_1",
        onPressed: () {
          counter1.value++;
        },
        tooltip: 'インクリメント',
        child: const Icon(Icons.add),
      ),
    );
  }
}

// Widget(View)と分離できた処理
Future<String?> Function() useShowMessageDialog(String title, String message,
    [bool negativeHidden = false, String positiveTitle = 'はい',
      String negativeTitle = 'キャンセル']) {
  final context = useContext();
  return () {
    return AppCommon().showMessageDialog(context, title, message,
        negativeHidden, positiveTitle, negativeTitle);
  };
}
Future<String?> Function() useShowMessageDialogType001() {
  return useShowMessageDialog('Hooksの検証',
      'メッセージ', false, 'Yes', 'No');
}
Future<String?> Function(String?) useShowMessageDialogType002() {
  final context = useContext();
  return (result) {
    return AppCommon().showMessageDialog(context, 'Hooksの検証',
        'メッセージの戻り値：$result', true, 'OK');
  };
}
Future<void> Function() useShowMessageDialogType003() {
  final context = useContext();
  final isMounted = useIsMounted();
  return () async {
    String? result = await AppCommon().showMessageDialog(
        context, 'Hooksの検証', 'メッセージ', false, 'はい', 'いいえ');
    if (!isMounted()) return;
    // ignore: use_build_context_synchronously
    await AppCommon().showMessageDialog(context, 'Hooksの検証',
        'メッセージの戻り値：$result', true, 'OK');
  };
}

class MaterialTest5Widget extends HookWidget {
  const MaterialTest5Widget({super.key, required this.heroTag});
  final String heroTag;

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
        FloatingActionButton(
          heroTag: "${heroTag}_3",
          onPressed: () {
            counter3.value++;
          },
          tooltip: 'インクリメント',
          child: const Icon(Icons.add),
        )
      ],
    );
  }
}
