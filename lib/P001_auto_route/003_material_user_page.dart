import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class MaterialUserPage extends StatelessWidget {
  const MaterialUserPage({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MaterialUserPage $name',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: const Text('HomePageへ'),
          onPressed: () => context.router.pop(),
        ),
      ),
    );
  }
}