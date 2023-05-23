import 'package:flutter/material.dart';

class MaterialTest4Page extends StatefulWidget {
  const MaterialTest4Page({super.key, required this.title});
  final String title;

  @override
  State<MaterialTest4Page> createState() => _MaterialTest4PageState();
}

class _MaterialTest4PageState extends State<MaterialTest4Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          child: const Text('戻る'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}