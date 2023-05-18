import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_test3/P001_auto_route/router.gr.dart';

class MaterialHomePage extends StatelessWidget {
  const MaterialHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MaterialHomePage',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          child: const Text('UserPageへ'),
          onPressed: () => context.router.push(MaterialUserRoute(name: 'Ryota')),
        ),
      ),
    );
  }
}