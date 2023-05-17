// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:flutter_test3/auto_route/stateless_home_page.dart' as _i1;
import 'package:flutter_test3/auto_route/stateless_user_page.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    StatelessHomeRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.StatelessHomePage(),
      );
    },
    StatelessUserRoute.name: (routeData) {
      final args = routeData.argsAs<StatelessUserRouteArgs>();
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i2.StatelessUserPage(
          key: args.key,
          name: args.name,
        ),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          StatelessHomeRoute.name,
          path: '/',
        ),
        _i3.RouteConfig(
          StatelessUserRoute.name,
          path: '/stateless-user-page',
        ),
      ];
}

/// generated route for
/// [_i1.StatelessHomePage]
class StatelessHomeRoute extends _i3.PageRouteInfo<void> {
  const StatelessHomeRoute()
      : super(
          StatelessHomeRoute.name,
          path: '/',
        );

  static const String name = 'StatelessHomeRoute';
}

/// generated route for
/// [_i2.StatelessUserPage]
class StatelessUserRoute extends _i3.PageRouteInfo<StatelessUserRouteArgs> {
  StatelessUserRoute({
    _i4.Key? key,
    required String name,
  }) : super(
          StatelessUserRoute.name,
          path: '/stateless-user-page',
          args: StatelessUserRouteArgs(
            key: key,
            name: name,
          ),
        );

  static const String name = 'StatelessUserRoute';
}

class StatelessUserRouteArgs {
  const StatelessUserRouteArgs({
    this.key,
    required this.name,
  });

  final _i4.Key? key;

  final String name;

  @override
  String toString() {
    return 'StatelessUserRouteArgs{key: $key, name: $name}';
  }
}
