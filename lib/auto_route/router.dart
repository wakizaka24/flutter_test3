import 'package:auto_route/auto_route.dart';
import 'package:flutter_test3/auto_route/stateless_home_page.dart';
import 'package:flutter_test3/auto_route/stateless_user_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: StatelessHomePage, initial: true),
    AutoRoute(page: StatelessUserPage),
  ],
)
class $AppRouter {}

/*
% pwd
/Users/rwakizaka/pc_data/project/rwakizaka32/flutter_test3
% fvm flutter pub pub run build_runner build --delete-conflicting-outputs
 */