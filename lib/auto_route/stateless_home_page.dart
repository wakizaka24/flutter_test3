import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_test3/auto_route/router.gr.dart';

class StatelessHomePage extends StatelessWidget {
  const StatelessHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'StatelessHomePage',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          child: const Text('StatelessUserPageへ'),
          onPressed: () => context.router.push(StatelessUserRoute(name: 'Ryota')),
        ),
      ),
    );
  }
}