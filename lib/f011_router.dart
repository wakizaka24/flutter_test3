import 'package:auto_route/auto_route.dart';
import 'package:flutter_test3/f001_material_home_page.dart';
import 'package:flutter_test3/f002_material_test1_page.dart';
import 'package:flutter_test3/f006_material_test2_page.dart';
import 'package:flutter_test3/f008_material_test4_page.dart';
import 'package:flutter_test3/f010_material_test6_page.dart';
import 'package:flutter_test3/f012_material_home3_page.dart';

/*
cd /Users/rwakizaka/pc_data/project/rwakizaka32/flutter_test3
fvm flutter pub pub run build_runner build --delete-conflicting-outputs
 */

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: MaterialHomePage, initial: true),
    AutoRoute(page: MaterialTest4Page),
    AutoRoute(page: MaterialTest6Page),
    AutoRoute(page: MaterialHome3Page, children: [
      AutoRoute(page: MaterialTest1Page),
      AutoRoute(page: MaterialTest2Page),
    ]),
    //MaterialTest7Page

  ],
)
class $AppRouter {}