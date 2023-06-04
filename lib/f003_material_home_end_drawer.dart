import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test3/f004_highlight_able_button.dart';
import 'package:flutter_test3/f005_app_common.dart';

import 'f011_router.gr.dart';

enum MaterialHomeDrawerType {
  autoRouter(title: 'Auto Router'),
  test2(title: 'テスト2'),
  test3(title: 'テスト3'),
  test4(title: 'テスト4'),
  test5(title: 'テスト5');

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
      physics: const NeverScrollableScrollPhysics(),
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
              Navigator.pop(context);

              switch (MaterialHomeDrawerType.values[i!]) {
                case MaterialHomeDrawerType.autoRouter:
                  context.navigateTo(const MaterialHome3Route());
                  return;
                default:
              }

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