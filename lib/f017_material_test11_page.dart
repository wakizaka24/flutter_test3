import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MaterialTest11Page extends HookConsumerWidget {
  final String title;
  final String heroTagBase;

  const MaterialTest11Page({
    super.key,
    required this.title,
    required this.heroTagBase
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 画面の高さ
    double deviceHeight = MediaQuery.of(context).size.height;

    final textField1Controller = useState(TextEditingController());
    final textField2Controller = useState(TextEditingController());
    final createHeroWidget1 = useCreateHeroWidget1('$heroTagBase + 1 + all',
      '遷移する', textField1Controller.value, textField2Controller.value, () {
          Navigator.of(context).push(
            MaterialPageRoute(
              // fullscreenDialog: true,
              builder: (BuildContext context) => MaterialTest11SubPage(
                title: title, heroTagBase: heroTagBase,
                editingTextField1Controller: textField1Controller.value,
                editingTextField2Controller: textField2Controller.value
              ),
            ),
          );
        });
    final createStackWidget2 = useCreateStackWidget2(heroTagBase, '遷移する',
        textField1Controller.value, textField2Controller.value, () {
            Navigator.of(context).push(
              MaterialPageRoute(
                // fullscreenDialog: true,
                builder: (BuildContext context) => MaterialTest11SubPage(
                title: title, heroTagBase: heroTagBase,
                editingTextField1Controller: textField1Controller.value,
                editingTextField2Controller: textField2Controller.value
              ),
            ),
          );
        });

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
                  createHeroWidget1(),
                  Container(height: 8),
                  createStackWidget2(),
                  Container(height: deviceHeight - 300),
                ])
            )
        )
    );
  }
}

Hero Function() useCreateHeroWidget1(String heroTag, String buttonTitle,
    TextEditingController textField1Controller,
    TextEditingController textField2Controller, Function() onPressed) {

  return () {
    return Hero(
      tag: heroTag,
      child: Card(
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
                    Container(height: 4),
                    TextField(
                      controller: textField1Controller,
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
                      controller: textField2Controller,
                      keyboardType: TextInputType.multiline,
                      minLines: 5,
                      maxLines: 5,
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
                    Container(height: 2),
                    Row(
                      children: [
                        const Spacer(),
                        ElevatedButton(
                          onPressed: onPressed,
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(82, 32),
                            textStyle: const TextStyle(fontSize: 13),
                            padding: const EdgeInsets.all(0),
                          ),
                          child: Text(buttonTitle),
                        ),
                      ],
                    ),
                  ]
              )
          )
      ),
    );
  };
}

Stack Function() useCreateStackWidget2(String heroTagBase, String buttonTitle,
    TextEditingController textField1Controller,
    TextEditingController textField2Controller, Function() onPressed) {

  return () {
    return Stack(children: [
      Hero(tag: '', child:
        Column(children: [
          Card(
            elevation: 1.0,
            color: Colors.blueGrey,
            margin: const EdgeInsets.all(24),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)),
            child: Container(height: 100),
          )
        ],)
      )
    ],);

    /*
    return Hero(
      tag: heroTag,
      child: Card(
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
                    Container(height: 4),
                    TextField(
                      controller: textField1Controller,
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
                      controller: textField2Controller,
                      keyboardType: TextInputType.multiline,
                      minLines: 5,
                      maxLines: 5,
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
                    Container(height: 2),
                    Row(
                      children: [
                        const Spacer(),
                        ElevatedButton(
                          onPressed: onPressed,
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(82, 32),
                            textStyle: const TextStyle(fontSize: 13),
                            padding: const EdgeInsets.all(0),
                          ),
                          child: Text(buttonTitle),
                        ),
                      ],
                    ),
                  ]
              )
          )
      ),
    );

    */
  };
}

class MaterialTest11SubPage extends HookConsumerWidget {
  final String title;
  final String heroTagBase;
  final TextEditingController editingTextField1Controller;
  final TextEditingController editingTextField2Controller;

  const MaterialTest11SubPage({
    super.key,
    required this.title,
    required this.heroTagBase,
    required this.editingTextField1Controller,
    required this.editingTextField2Controller
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textField1Controller = useState(TextEditingController(
        text: editingTextField1Controller.text));
    final textField2Controller = useState(TextEditingController(
        text: editingTextField2Controller.text));

    final createHeroWidget1 = useCreateHeroWidget1('$heroTagBase + 1 + all',
        '戻る', textField1Controller.value, textField2Controller.value, () {
          editingTextField1Controller.text = textField1Controller.value.text;
          editingTextField2Controller.text = textField2Controller.value.text;
          Navigator.pop(context);
        });

    useEffect(() {
      debugPrint('MaterialTest11SubPageの初期化処理');
      WidgetsBinding.instance.addPostFrameCallback((_) {
      });

      return () {
        debugPrint('MaterialTest11SubPageの解放処理');
      };
    }, const []);

    return Scaffold(
        // appBar: AppBar(
        //   title: Text(title),
        // ),
        body: SafeArea(
            child: GestureDetector(
                onTap: () {
                  final FocusScopeNode focusScope = FocusScope.of(context);
                  if (!focusScope.hasPrimaryFocus && focusScope.hasFocus) {
                    FocusManager.instance.primaryFocus!.unfocus();
                  }
                },
                child: ListView(children: [
                  createHeroWidget1()
                ])
            )
        )
    );
  }
}