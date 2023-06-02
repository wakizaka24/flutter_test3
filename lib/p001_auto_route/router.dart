import 'package:auto_route/auto_route.dart';
import 'package:flutter_test3/P001_auto_route/f002_material_home_page.dart';
import 'package:flutter_test3/P001_auto_route/f003_material_user_page.dart';
import 'package:flutter_test3/f001_material_home_page.dart' as p1;

import '../f002_material_test1_page.dart';
import '../f003_material_home_end_drawer.dart';
import '../f006_material_test2_page.dart';
import '../f007_material_test3_page.dart';
import '../f008_material_test4_page.dart';
import '../f009_material_test5_page.dart';
import '../f010_material_test6_page.dart';

/*
cd /Users/rwakizaka/pc_data/project/rwakizaka32/flutter_test3
fvm flutter pub pub run build_runner build --delete-conflicting-outputs
 */

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: MaterialHomePage, initial: true),
    AutoRoute(page: MaterialUserPage),
    AutoRoute(page: p1.MaterialHomePage),
    AutoRoute(page: MaterialHomeDrawer),
    AutoRoute(page: MaterialTest1Page),
    AutoRoute(page: MaterialTest2Page),
    AutoRoute(page: MaterialTest3Page),
    AutoRoute(page: MaterialTest4Page),
    AutoRoute(page: MaterialTest5Page),
    AutoRoute(page: MaterialTest6Page),
  ],
)
class $AppRouter {}