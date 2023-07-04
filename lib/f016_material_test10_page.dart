import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MaterialTest10Page extends HookConsumerWidget {
  final String title;

  const MaterialTest10Page({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    // 画面の高さ
    double deviceHeight = MediaQuery.of(context).size.height;

    useEffect(() {
      debugPrint('MaterialTest10Pageの初期化処理');
      WidgetsBinding.instance.addPostFrameCallback((_) {
      });

      return () {
        debugPrint('MaterialTest10Pageの解放処理');
      };
    }, const []);

    final textField1Controller = useState(TextEditingController());

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
            child: ListView(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                  bottom: 16,
                ),
                children: [
                  Container(height: 800),

                  Row(
                      children: [
                        // const Spacer(),

                        Expanded(child:

                        Stack(alignment: Alignment.topRight,
                          children: [
                            Positioned(
                              child: Container(
                                height: 10,
                                width: 10,
                                color: Colors.blue,
                              ),
                            )

                        // AnimatedPositioned(
                        //   left: 0,
                        //   duration: const Duration(seconds: 2),
                        //   child: Container(
                        //     height: 10,
                        //     width: 10,
                        //     color: Colors.blue,
                        //   ),
                        // ),

                          ]
                        )

                        // AnimatedPadding(
                        //   padding: const EdgeInsets.only(left: 0),
                        //   duration: const Duration(seconds: 2),
                        //   curve: Curves.easeInOut,
                        //     child: Container(
                        //       height: 10,
                        //       width: 10,
                        //       color: Colors.blue,
                        //     ),
                        // ),


                        //   Container(color: Colors.green,height: 10,),

                        ),

                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(
                              130,
                              32,
                            ),
                            textStyle: const TextStyle(fontSize: 13),
                            padding: const EdgeInsets.all(0),
                          ),
                          child: const Text('ElevatedButton'),
                        ),
                        const Spacer(),
                      ]
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
                ]
            )
        )
      )
    );
  }
}

/*
// 最小構成
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MaterialTest10Page extends HookConsumerWidget {
  final String title;

  const MaterialTest10Page({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    // 画面の高さ
    double deviceHeight = MediaQuery.of(context).size.height;

    useEffect(() {
      debugPrint('MaterialTest10Pageの初期化処理');
      WidgetsBinding.instance.addPostFrameCallback((_) {
      });

      return () {
        debugPrint('MaterialTest10Pageの解放処理');
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
 */