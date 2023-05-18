import 'package:flutter/material.dart';
import '003_material_test1_page.dart';

// ページ
// Stateオブジェクトを持ち。Stateオブジェクトは外観に影響を与える。
class MaterialHomePage extends StatefulWidget {
  const MaterialHomePage({super.key, required this.title});
  final String title;

  @override
  State<MaterialHomePage> createState() => _MaterialHomePageState();
}

// 状態
class _MaterialHomePageState extends State<MaterialHomePage> {
  int _selectedIndex = 0;
  final _pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ページを示すオブジェクトから値を取得する。
        title: Text(widget.title),
      ),
      body: PageView(
        scrollDirection: Axis.horizontal, // 横
        controller: _pageViewController,
        pageSnapping: true, // ページごとにスクロールを止める
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: const <Widget>[
          MaterialTest1Page(title: 'タブ1',),
          MaterialTest1Page(title: 'タブ2',),
          MaterialTest1Page(title: 'タブ3',),
          MaterialTest1Page(title: 'タブ4',),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          activeIcon: Icon(Icons.book_online),
          label: 'Book',
          tooltip: "Bookページ"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          activeIcon: Icon(Icons.business_center),
          label: 'Business',
          tooltip: "ビジネスページ",
          backgroundColor: Colors.green,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          activeIcon: Icon(Icons.school_outlined),
          label: 'School',
          tooltip: "スクールページ",
          backgroundColor: Colors.purple,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          activeIcon: Icon(Icons.settings_accessibility),
          label: 'Settings',
          tooltip: "設定ページ",
          backgroundColor: Colors.pink,
        ),],
        onTap: (int index) {
          _pageViewController.animateToPage(index,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut);
        },
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 11,
        unselectedFontSize: 11,
      ),
    );
  }
}