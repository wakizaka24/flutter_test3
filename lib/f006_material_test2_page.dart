import 'package:flutter/material.dart';
import 'package:flutter_test3/f008_material_test4_page.dart';

class MaterialTest2Page extends StatefulWidget {
  const MaterialTest2Page({super.key, required this.heroTag});
  final String heroTag;

  @override
  State<MaterialTest2Page> createState() => _MaterialTest2PageState();
}

class _MaterialTest2PageState extends State<MaterialTest2Page>
    with AutomaticKeepAliveClientMixin {

  static const dataNum = 32;

  List<String> titles = [
    for (int i = 0; i<dataNum; i++) ... {
      "タイトル${i+1}"
    }
  ];

  List<String> subTitles = [
    for (int i = 0; i<dataNum; i++) ... {
      "サブタイトル${i+1}"
    }
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 8,
          ),
          children: [
            for (int i=0; i<dataNum; i++) ... {
              Card(
                child: ListTile(
                  leading: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.people),
                    constraints: const BoxConstraints(),
                    onPressed: () {
                    }
                  ),
                  title: Text(titles[i]),
                  subtitle: Text(subTitles[i]),
                  trailing: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.more_vert),
                    constraints: const BoxConstraints(),
                    onPressed: () {
                    }
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  onTap: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>
                      MaterialTest4Page(title: titles[i])),
                    );
                  },
                ),
              ),
            }
          ]
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: widget.heroTag,
        onPressed: () {
        },
        tooltip: 'インクリメント',
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}