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
    final leftIconPositionRight = useState(50.0);
    final leftIconAnimation = useState(true);

    final rightIconPositionLeft = useState(50.0);
    final rightIconAnimation = useState(true);

    leftAnimationOnEnd() {
      if (!leftIconAnimation.value) {
        return;
      }
      if (leftIconPositionRight.value == 0) {
        leftIconPositionRight.value = 50;
      } else {
        leftIconPositionRight.value = 0;
      }
    }

    rightAnimationOnEnd() {
      if (!rightIconAnimation.value) {
        return;
      }
      if (rightIconPositionLeft.value == 0) {
        rightIconPositionLeft.value = 50;
      } else {
        rightIconPositionLeft.value = 0;
      }
    }

    useEffect(() {
      debugPrint('MaterialTest10Pageの初期化処理');
      WidgetsBinding.instance.addPostFrameCallback((_) {
        leftAnimationOnEnd();
        rightAnimationOnEnd();
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
                                right: leftIconPositionRight.value,
                                top: 0,
                                height: 48,
                                width: 48,
                                duration: const Duration(milliseconds: 500),
                                onEnd: () => leftAnimationOnEnd(),
                                child: const Icon(Icons.arrow_circle_right),
                              )
                            ]
                          )
                        ),

                        ElevatedButton(
                          onPressed: () {
                            if (leftIconAnimation.value) {
                              leftIconAnimation.value = false;
                              rightIconAnimation.value = false;
                            } else {
                              leftIconAnimation.value = true;
                              leftAnimationOnEnd();
                              rightIconAnimation.value = true;
                              rightAnimationOnEnd();
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

                        Expanded(child:
                          Stack(
                              children: [
                                Container(
                                  height: 48,
                                ),
                                AnimatedPositioned(
                                  left: rightIconPositionLeft.value,
                                  top: 0,
                                  height: 48,
                                  width: 48,
                                  duration: const Duration(milliseconds: 500),
                                  onEnd: () => rightAnimationOnEnd(),
                                  child: const Icon(Icons.arrow_circle_left),
                                )
                              ]
                          )
                        ),
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