import 'package:flutter/material.dart';
import 'package:flutter_test3/f002_material_test1_page.dart';
import 'package:flutter_test3/f003_material_home_end_drawer.dart';
import 'package:flutter_test3/f005_app_common.dart';
import 'package:flutter_test3/f006_material_test2_page.dart';
import 'package:flutter_test3/f007_material_test3_page.dart';

// ページ
// Stateオブジェクトを持ち。Stateオブジェクトは外観に影響を与える。
class MaterialHomePage extends StatefulWidget {
  const MaterialHomePage({super.key, required this.title});
  final String title;

  @override
  State<MaterialHomePage> createState() => MaterialHomePageState();
}

// 状態
class MaterialHomePageState extends State<MaterialHomePage> {
  int _selectedIndex = 0;
  PageController pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: AppCommon().materialHomePageScaffoldKey,
      endDrawer: const MaterialHomeDrawer(),
      appBar: AppBar(
        // ページを示すオブジェクトから値を取得する。
        title: Text(widget.title),
      ),
      body: PageView(
        scrollDirection: Axis.horizontal, // 横
        controller: pageViewController,
        pageSnapping: true, // ページごとにスクロールを止める
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: const <Widget>[
          MaterialTest1Page(heroTag: 'hero1'),
          MaterialTest2Page(heroTag: 'hero2'),
          MaterialTest3Page(heroTag: 'hero3'),
          MaterialTest3Page(heroTag: 'hero4'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          // icon: Icon(Icons.book),
          // activeIcon: Icon(Icons.book_online),
          icon: Icon(Icons.business),
          activeIcon: Icon(Icons.business_center),
          label: 'Green',
          tooltip: 'Greenページ',
          // backgroundColor: Colors.green,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_chart),
          activeIcon: Icon(Icons.add_chart_outlined),
          label: 'Blue Accent',
          tooltip: 'Blue Accentページ',
          // backgroundColor: Colors.blueAccent,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.accessibility),
          activeIcon: Icon(Icons.accessibility_sharp),
          label: 'Pink Accent',
          tooltip: 'Pink Accentページ',
          // backgroundColor: Colors.pinkAccent,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          activeIcon: Icon(Icons.settings_applications_sharp),
          label: 'Settings',
          tooltip: '設定ページ',
          // backgroundColor: Colors.teal,
        ),],
        onTap: (int index) {
          pageViewController.animateToPage(index,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut);
        },
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed, // 普通のタブバー
        selectedFontSize: 11, // 普通のタブバー
        unselectedFontSize: 11, // 普通のタブバー
      ),
    );
  }
}