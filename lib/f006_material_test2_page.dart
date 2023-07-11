import 'package:flutter/material.dart';

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
      body: Navigator(onGenerateRoute: (settings) {
          return MaterialPageRoute<Widget>(
            builder: (context) {
              return ListView(
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
                                MaterialTest4Page(title: titles[i],
                                    autoRouter: false)),
                          );
                        },
                      ),
                    ),
                  }
                ]
              );
            });
      }),
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

class MaterialTest4Page extends StatefulWidget {
  const MaterialTest4Page({super.key, required this.title,
    required this.autoRouter});
  final String title;
  final bool autoRouter;

  @override
  State<MaterialTest4Page> createState() => _MaterialTest4PageState();
}

class _MaterialTest4PageState extends State<MaterialTest4Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 13),
            padding: const EdgeInsets.all(15),
          ),
          child: Text('${widget.title} 戻る'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}