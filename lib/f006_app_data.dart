import 'package:flutter/material.dart';

class AppData {
  final GlobalKey<ScaffoldState> materialHomePageScaffoldKey
    = GlobalKey<ScaffoldState>();

  static final AppData _instance = AppData._internal();

  factory AppData() {
    return _instance;
  }

  AppData._internal();
}