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
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:flutter_test3/f001_material_home_page.dart' as _i1;
import 'package:flutter_test3/f002_material_test1_page.dart' as _i5;
import 'package:flutter_test3/f006_material_test2_page.dart' as _i6;
import 'package:flutter_test3/f008_material_test4_page.dart' as _i2;
import 'package:flutter_test3/f010_material_test6_page.dart' as _i3;
import 'package:flutter_test3/f012_material_home3_page.dart' as _i4;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    MaterialHomeRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.MaterialHomePage(),
      );
    },
    MaterialTest4Route.name: (routeData) {
      final args = routeData.argsAs<MaterialTest4RouteArgs>();
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i2.MaterialTest4Page(
          key: args.key,
          title: args.title,
          autoRouter: args.autoRouter,
        ),
      );
    },
    MaterialTest6Route.name: (routeData) {
      final args = routeData.argsAs<MaterialTest6RouteArgs>();
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i3.MaterialTest6Page(
          key: args.key,
          title: args.title,
        ),
      );
    },
    MaterialHome3Route.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.MaterialHome3Page(),
      );
    },
    MaterialTest1Route.name: (routeData) {
      final args = routeData.argsAs<MaterialTest1RouteArgs>();
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i5.MaterialTest1Page(
          key: args.key,
          heroTag: args.heroTag,
        ),
      );
    },
    MaterialTest2Route.name: (routeData) {
      final args = routeData.argsAs<MaterialTest2RouteArgs>();
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i6.MaterialTest2Page(
          key: args.key,
          heroTag: args.heroTag,
        ),
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          MaterialHomeRoute.name,
          path: '/',
        ),
        _i7.RouteConfig(
          MaterialTest4Route.name,
          path: '/material-test4-page',
        ),
        _i7.RouteConfig(
          MaterialTest6Route.name,
          path: '/material-test6-page',
        ),
        _i7.RouteConfig(
          MaterialHome3Route.name,
          path: '/material-home3-page',
          children: [
            _i7.RouteConfig(
              MaterialTest1Route.name,
              path: 'material-test1-page',
              parent: MaterialHome3Route.name,
            ),
            _i7.RouteConfig(
              MaterialTest2Route.name,
              path: 'material-test2-page',
              parent: MaterialHome3Route.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.MaterialHomePage]
class MaterialHomeRoute extends _i7.PageRouteInfo<void> {
  const MaterialHomeRoute()
      : super(
          MaterialHomeRoute.name,
          path: '/',
        );

  static const String name = 'MaterialHomeRoute';
}

/// generated route for
/// [_i2.MaterialTest4Page]
class MaterialTest4Route extends _i7.PageRouteInfo<MaterialTest4RouteArgs> {
  MaterialTest4Route({
    _i8.Key? key,
    required String title,
    required bool autoRouter,
  }) : super(
          MaterialTest4Route.name,
          path: '/material-test4-page',
          args: MaterialTest4RouteArgs(
            key: key,
            title: title,
            autoRouter: autoRouter,
          ),
        );

  static const String name = 'MaterialTest4Route';
}

class MaterialTest4RouteArgs {
  const MaterialTest4RouteArgs({
    this.key,
    required this.title,
    required this.autoRouter,
  });

  final _i8.Key? key;

  final String title;

  final bool autoRouter;

  @override
  String toString() {
    return 'MaterialTest4RouteArgs{key: $key, title: $title, autoRouter: $autoRouter}';
  }
}

/// generated route for
/// [_i3.MaterialTest6Page]
class MaterialTest6Route extends _i7.PageRouteInfo<MaterialTest6RouteArgs> {
  MaterialTest6Route({
    _i8.Key? key,
    required String title,
  }) : super(
          MaterialTest6Route.name,
          path: '/material-test6-page',
          args: MaterialTest6RouteArgs(
            key: key,
            title: title,
          ),
        );

  static const String name = 'MaterialTest6Route';
}

class MaterialTest6RouteArgs {
  const MaterialTest6RouteArgs({
    this.key,
    required this.title,
  });

  final _i8.Key? key;

  final String title;

  @override
  String toString() {
    return 'MaterialTest6RouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i4.MaterialHome3Page]
class MaterialHome3Route extends _i7.PageRouteInfo<void> {
  const MaterialHome3Route({List<_i7.PageRouteInfo>? children})
      : super(
          MaterialHome3Route.name,
          path: '/material-home3-page',
          initialChildren: children,
        );

  static const String name = 'MaterialHome3Route';
}

/// generated route for
/// [_i5.MaterialTest1Page]
class MaterialTest1Route extends _i7.PageRouteInfo<MaterialTest1RouteArgs> {
  MaterialTest1Route({
    _i8.Key? key,
    required String heroTag,
  }) : super(
          MaterialTest1Route.name,
          path: 'material-test1-page',
          args: MaterialTest1RouteArgs(
            key: key,
            heroTag: heroTag,
          ),
        );

  static const String name = 'MaterialTest1Route';
}

class MaterialTest1RouteArgs {
  const MaterialTest1RouteArgs({
    this.key,
    required this.heroTag,
  });

  final _i8.Key? key;

  final String heroTag;

  @override
  String toString() {
    return 'MaterialTest1RouteArgs{key: $key, heroTag: $heroTag}';
  }
}

/// generated route for
/// [_i6.MaterialTest2Page]
class MaterialTest2Route extends _i7.PageRouteInfo<MaterialTest2RouteArgs> {
  MaterialTest2Route({
    _i8.Key? key,
    required String heroTag,
  }) : super(
          MaterialTest2Route.name,
          path: 'material-test2-page',
          args: MaterialTest2RouteArgs(
            key: key,
            heroTag: heroTag,
          ),
        );

  static const String name = 'MaterialTest2Route';
}

class MaterialTest2RouteArgs {
  const MaterialTest2RouteArgs({
    this.key,
    required this.heroTag,
  });

  final _i8.Key? key;

  final String heroTag;

  @override
  String toString() {
    return 'MaterialTest2RouteArgs{key: $key, heroTag: $heroTag}';
  }
}
