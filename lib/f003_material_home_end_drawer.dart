import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test3/f004_highlight_able_button.dart';
import 'package:flutter_test3/f005_app_common.dart';

import 'f013_material_test7_page.dart';
import 'f014_material_test8_page.dart';
import 'f015_material_test9_page.dart';
import 'f016_material_test10_page.dart';
import 'f017_material_test11_page.dart';

enum MaterialHomeDrawerType {
  freezed(title: 'Freezedの検証'),
  webView(title: 'WebViewの検証'),
  halfModal(title: '半モーダルの検証'),
  animation(title: 'アニメーションの検証'),
  heroTagTransition(title: '画面遷移アニメの検証'),
  test7(title: 'テスト7'),
  test8(title: 'テスト8'),
  test9(title: 'テスト9'),
  test10(title: 'テスト10'),
  test11(title: 'テスト11'),
  test12(title: 'テスト12'),
  test13(title: 'テスト13'),
  test14(title: 'テスト14'),
  test15(title: 'テスト15');

  const MaterialHomeDrawerType({required this.title});
  final String title;
}

class MaterialHomeDrawer extends StatefulWidget {
  const MaterialHomeDrawer({super.key});

  @override
  State<MaterialHomeDrawer> createState() => _MaterialHomeDrawerState();
}

class _MaterialHomeDrawerState extends State<MaterialHomeDrawer> {
  int? _highlightedIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    ListView menuList = ListView(
      // physics: const NeverScrollableScrollPhysics(),
      children: [
        for (int i=0; i < MaterialHomeDrawerType.values.length; i++) ... {
          HighlightAbleButton(
            title: MaterialHomeDrawerType.values[i].title,
            fontSize: 18,
            index: i,
            isHighlighted: _highlightedIndex == i,
            onTapDown: (int? i) async {
              setState(() {
                _highlightedIndex = i;
              });
            },
            onTap: (int? i) async {
              setState(() {
                _highlightedIndex = null;
              });

              switch (MaterialHomeDrawerType.values[i!]) {
                case MaterialHomeDrawerType.freezed:
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>
                        MaterialTest7Page(title: MaterialHomeDrawerType
                            .freezed.title)),
                  );
                  return;
                case MaterialHomeDrawerType.webView:
                  if (kIsWeb) {
                    if (!mounted) return;
                    await AppCommon()
                        .showMessageDialog(context, 'WebViewの検証',
                        'WebViewはWeb環境に対応していません',
                        true, 'OK');
                    return;
                  }

                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>
                        MaterialTest8Page(title: MaterialHomeDrawerType
                            .webView.title)),
                  );
                  return;
                case MaterialHomeDrawerType.halfModal:
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>
                        MaterialTest9Page(title: MaterialHomeDrawerType
                            .halfModal.title)),
                  );
                  return;
                case MaterialHomeDrawerType.animation:
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>
                      MaterialTest10Page(title: MaterialHomeDrawerType
                          .animation.title)),
                  );
                  return;
                case MaterialHomeDrawerType.heroTagTransition:
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>
                        MaterialTest11Page(
                          title: MaterialHomeDrawerType.heroTagTransition.title,
                          heroTagBase: 'heroTagTransitionPage',
                        )),
                  );
                  return;
                default:
              }

              if (!mounted) return;
              Navigator.pop(context);

              final snackBar = SnackBar(
                content: Text('${MaterialHomeDrawerType
                    .values[i].title}をクリックしました!'),
                action: SnackBarAction(
                  label: '詳細',
                  onPressed: () {
                    AppCommon().materialHomePageScaffoldKey.currentState!
                        .openEndDrawer();
                  },
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            onTapCancel: (int? i) async {
              setState(() {
                _highlightedIndex = null;
              });
            },
          )
        }
      ],
    );

    return SafeArea(
      bottom: false,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16)),
        child: Drawer(
          backgroundColor: theme.colorScheme.background,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_forward),
                )
              ),
              Expanded(
                child: menuList
              ),
            ]
          )
        )
      )
    );
  }
}