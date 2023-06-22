import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MaterialTest9Page extends HookConsumerWidget {
  final String title;

  const MaterialTest9Page({super.key, required this.title});

  Widget creteBaseWidget(BuildContext context, Widget topWidget,
      List<TextEditingController> controllers,
      List<TextEditingController>? originals) {
    var listViewRows = createListViewRows(controllers);

    // TODO: 処理タイミングを探す
    // if (originals != null) {
    //   for (int i = 0; i < controllers.length; i++) {
    //     controllers[i].text = originals[i].text;
    //   }
    // }

    return SafeArea(
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
                  top: 0,
                  right: 16,
                  bottom: 16,
                ),
                children: [
                  topWidget,
                  for (int i=0; i < listViewRows.length; i++) ... {
                    listViewRows[i],
                  }
                ]
            )
        )
    );
  }

  List<Widget> createListViewRows(List<TextEditingController> controllers) {
    return [
      for (int i = 0; i < controllers.length / 2; i = i + 2) ... {
        TextField(
          controller: controllers[i],
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
          controller: controllers[i + 1],
          keyboardType: TextInputType.multiline,
          maxLines: null,
          style: const TextStyle(fontSize: 15),
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(8),
            border: OutlineInputBorder(),
            hintText: '本文\n\n\n\n\n',
          ),
          onChanged: (text) {
            debugPrint("Textの変更検知={$text}");
          },
        ),

        Container(height: 8),
      }
    ];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    // 画面の高さ
    double deviceHeight = MediaQuery.of(context).size.height;

    useEffect(() {
      debugPrint('MaterialTest9Pageの初期化処理');
      WidgetsBinding.instance.addPostFrameCallback((_) {
      });

      return () {
        debugPrint('MaterialTest9Pageの解放処理');
      };
    }, const []);

    final mainTextFieldControllers = useState([
      for (int i = 0; i < 15 * 2; i++) ... {
        TextEditingController(),
      }
    ]);

    final halfModalTextFieldControllers = useState([
      for (int i = 0; i < 15 * 2; i++) ... {
        TextEditingController(),
      }
    ]);

    var closeContainer = Container(
        padding: const EdgeInsets.fromLTRB(
            18, 14, 0, 3),
        child: Row(
          children: [
            ElevatedButton(
              onPressed: () {
                for (int i = 0; i < mainTextFieldControllers
                    .value.length; i++) {
                  mainTextFieldControllers.value[i].text
                    = halfModalTextFieldControllers.value[i].text;
                }

                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(150, 32),
                textStyle: const TextStyle(
                    fontSize: 13),
                padding: const EdgeInsets.all(0),
              ),
              child: const Text('閉じる'),
            ),
          ],
        )
    );

    showHalfModal() {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          var body = creteBaseWidget(context,
              Container(height: 8), halfModalTextFieldControllers.value,
              mainTextFieldControllers.value);
          return Stack(children: [
            Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.background,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.only(top: 68),
                height: deviceHeight * 0.8,
                child: Scaffold(
                    body: body
                )
            ),
            closeContainer
          ]);
        },
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(16)
            )
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: creteBaseWidget(context,
            Container(
              padding: const EdgeInsets.fromLTRB(0, 14, 0, 3),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      showHalfModal();
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(150, 32),
                      textStyle: const TextStyle(fontSize: 13),
                      padding: const EdgeInsets.all(0),
                    ),
                    child: const Text('半モーダル表示'),
                  ),
                ],
              ),
            ), mainTextFieldControllers.value, null
        )
    );
  }
}