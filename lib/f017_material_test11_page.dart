import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MaterialTest11Page extends HookConsumerWidget {
  final String title;

  const MaterialTest11Page({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 画面の高さ
    double deviceHeight = MediaQuery.of(context).size.height;

    final textField1Controller = useState(TextEditingController());
    final textField2Controller = useState(TextEditingController());

    useEffect(() {
      debugPrint('MaterialTest11Pageの初期化処理');
      WidgetsBinding.instance.addPostFrameCallback((_) {
      });

      return () {
        debugPrint('MaterialTest11Pageの解放処理');
      };
    }, const []);

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: SafeArea(
            child: GestureDetector(
                onTap: () {
                  final FocusScopeNode focusScope = FocusScope.of(context);
                  if (!focusScope.hasPrimaryFocus && focusScope.hasFocus) {
                    FocusManager.instance.primaryFocus!.unfocus();
                  }
                },
                child: ListView(children: [
                  Container(height: deviceHeight - 300),
                  Card(
                      elevation: 1.0,
                      margin: const EdgeInsets.all(24),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(padding: const EdgeInsets.fromLTRB(15, 15, 15, 11),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('遷移1',
                                    style: TextStyle(
                                        fontSize: 21,
                                        // fontWeight: FontWeight.bold
                                    ),

                                ),
                                Container(height: 8),
                                TextField(
                                  controller: textField1Controller.value,
                                  style: const TextStyle(fontSize: 15),
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(8),
                                    border: OutlineInputBorder(),
                                    hintText: '宛先',
                                  ),
                                  onChanged: (text) {
                                    debugPrint("Textの変更検知={$text}");
                                  },
                                ),
                                Container(height: 8),
                                TextField(
                                  controller: textField2Controller.value,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  style: const TextStyle(fontSize: 15),
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(8),
                                    border: OutlineInputBorder(),
                                    hintText: '本文\n\n\n',
                                  ),
                                  onChanged: (text) {
                                    debugPrint("Textの変更検知={$text}");
                                  },
                                ),
                                Container(height: 8),
                                Row(
                                  children: [
                                    const Spacer(),
                                    ElevatedButton(
                                      onPressed: () {
                                      },
                                      style: ElevatedButton.styleFrom(
                                        fixedSize: const Size(82, 32),
                                        textStyle: const TextStyle(fontSize: 13),
                                        padding: const EdgeInsets.all(0),
                                      ),
                                      child: const Text('移動する'),
                                    ),
                                  ],
                                ),
                              ]
                          )
                      )
                  ),
                  Container(height: deviceHeight - 300),
                ])
            )
        )
    );
  }
}

class MaterialTest11SubPage extends HookConsumerWidget {
  final String title;

  const MaterialTest11SubPage({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    // 画面の高さ
    double deviceHeight = MediaQuery.of(context).size.height;

    useEffect(() {
      debugPrint('MaterialTest11SubPageの初期化処理');
      WidgetsBinding.instance.addPostFrameCallback((_) {
      });

      return () {
        debugPrint('MaterialTest11SubPageの解放処理');
      };
    }, const []);

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container()
    );
  }
}