import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class MaterialTest7Page extends StatefulWidget {
  const MaterialTest7Page({super.key, required this.title,
    required this.autoRouter});
  final String title;
  final bool autoRouter;

  @override
  State<MaterialTest7Page> createState() => _MaterialTest7PageState();
}

class _MaterialTest7PageState extends State<MaterialTest7Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 13),
            padding: const EdgeInsets.all(0),
          ),
          child: const Text('戻る'),
          onPressed: () {
            if (!widget.autoRouter) {
              Navigator.pop(context);
            } else {
              context.router.pop();
            }
          },
        ),
      ),
    );
  }
}