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
import 'package:flutter_test3/P001_auto_route/002_material_home_page.dart'
    as _i1;
import 'package:flutter_test3/P001_auto_route/003_material_user_page.dart'
    as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    MaterialHomeRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.MaterialHomePage(),
      );
    },
    MaterialUserRoute.name: (routeData) {
      final args = routeData.argsAs<MaterialUserRouteArgs>();
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i2.MaterialUserPage(
          key: args.key,
          name: args.name,
        ),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          MaterialHomeRoute.name,
          path: '/',
        ),
        _i3.RouteConfig(
          MaterialUserRoute.name,
          path: '/material-user-page',
        ),
      ];
}

/// generated route for
/// [_i1.MaterialHomePage]
class MaterialHomeRoute extends _i3.PageRouteInfo<void> {
  const MaterialHomeRoute()
      : super(
          MaterialHomeRoute.name,
          path: '/',
        );

  static const String name = 'MaterialHomeRoute';
}

/// generated route for
/// [_i2.MaterialUserPage]
class MaterialUserRoute extends _i3.PageRouteInfo<MaterialUserRouteArgs> {
  MaterialUserRoute({
    _i4.Key? key,
    required String name,
  }) : super(
          MaterialUserRoute.name,
          path: '/material-user-page',
          args: MaterialUserRouteArgs(
            key: key,
            name: name,
          ),
        );

  static const String name = 'MaterialUserRoute';
}

class MaterialUserRouteArgs {
  const MaterialUserRouteArgs({
    this.key,
    required this.name,
  });

  final _i4.Key? key;

  final String name;

  @override
  String toString() {
    return 'MaterialUserRouteArgs{key: $key, name: $name}';
  }
}
