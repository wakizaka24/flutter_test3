import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MaterialTest10Page extends HookConsumerWidget {
  final String title;

  const MaterialTest10Page({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 画面の高さ
    double deviceHeight = MediaQuery.of(context).size.height;

    final textField1Controller = useState(TextEditingController());
    final leftIconPositionLeft = useState(50.0);
    final leftIconAnimation = useState(true);

    leftAnimationOnEnd() {
      if (!leftIconAnimation.value) {
        return;
      }
      if (leftIconPositionLeft.value == 0) {
        leftIconPositionLeft.value = 50;
      } else {
        leftIconPositionLeft.value = 0;
      }
    }

    useEffect(() {
      debugPrint('MaterialTest10Pageの初期化処理');
      WidgetsBinding.instance.addPostFrameCallback((_) {
        leftAnimationOnEnd();
      });

      return () {
        debugPrint('MaterialTest10Pageの解放処理');
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
            child: ListView(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                  bottom: 16,
                ),
                children: [
                  Container(height: deviceHeight - 300),

                  Row(
                      children: [
                        Expanded(child:
                          Stack(
                            children: [
                              Container(
                                height: 48,
                              ),
                              AnimatedPositioned(
                                right: leftIconPositionLeft.value,
                                top: 0,
                                height: 48,
                                width: 48,
                                duration: const Duration(milliseconds: 500),
                                onEnd: () => leftAnimationOnEnd(),
                                child: Container(
                                  color: Colors.green,
                                ),
                              )
                            ]
                          )
                        ),

                        ElevatedButton(
                          onPressed: () {
                            if (leftIconAnimation.value) {
                              leftIconAnimation.value = false;
                            } else {
                              leftIconAnimation.value = true;
                              leftAnimationOnEnd();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(
                              130,
                              32,
                            ),
                            textStyle: const TextStyle(fontSize: 13),
                            padding: const EdgeInsets.all(0),
                          ),
                          child: Text(leftIconAnimation.value
                              ? 'STOP' : 'START'),
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