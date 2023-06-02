import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test3/f011_router.gr.dart';

class MaterialHome3Page extends StatelessWidget {
  const MaterialHome3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        MaterialTest1Route(heroTag: 'hero5'),
        MaterialTest2Route(heroTag: 'hero6')
      ],
      builder: (context, child, animation) {
        final tabsRouter = context.tabsRouter;
        return Scaffold(
          // endDrawer: const MaterialHomeDrawer(),
          appBar: AppBar(
            title: const Text('Auto Routerの検証'),
          ),
          body: child,
          bottomNavigationBar: NavigationBar(
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.business),
                label: 'ルート1',
              ),
              NavigationDestination(
                icon: Icon(Icons.add_chart),
                label: 'ルート2',
              ),
            ],
            selectedIndex: tabsRouter.activeIndex,
            onDestinationSelected: tabsRouter.setActiveIndex,
          ),
        );
      }
    );
  }
}
