import 'package:auto_route/auto_route.dart';
import 'package:flutter_test3/P001_auto_route/002_material_home_page.dart';
import 'package:flutter_test3/P001_auto_route/003_material_user_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: MaterialHomePage, initial: true),
    AutoRoute(page: MaterialUserPage),
  ],
)
class $AppRouter {}

/*
% pwd
/Users/rwakizaka/pc_data/project/rwakizaka32/flutter_test3
% fvm flutter pub pub run build_runner build --delete-conflicting-outputs
 */