import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart' as sql3;

class AppCommon {
  static final AppCommon _instance = AppCommon._internal();

  factory AppCommon() {
    return _instance;
  }

  AppCommon._internal();

  final GlobalKey<ScaffoldState> materialHomePageScaffoldKey
    = GlobalKey<ScaffoldState>();

  Future<String?> showMessageDialog(
      BuildContext context, String title, String message,
      [bool negativeHidden = false, String positiveTitle = 'はい',
        String negativeTitle = 'キャンセル']) async {
    return await showDialog<String>(
        context: context,
        builder: (_) {
          return WillPopScope(
            child: AlertDialog(
              title: Text(title),
              content: Text(message),
              actions: <Widget>[
                Visibility(
                  visible: !negativeHidden,
                  child: GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 0,
                        top: 0,
                        right: 8,
                        bottom: 16,
                      ),
                      child: Text(negativeTitle)
                    ),
                    onTap: () {
                      Navigator.pop(context, 'negative');
                    },
                  ),
                ),
                GestureDetector(
                  child: Padding(
                      padding: const EdgeInsets.only(
                        left: 0,
                        top: 0,
                        right: 16,
                        bottom: 16,
                      ),
                      child: Text(positiveTitle)
                  ),
                  onTap: () {
                    Navigator.pop(context, 'positive');
                  },
                )
              ],
            ),
            onWillPop: () async => false,
          );
        });
  }

  Future<sql3.Database> getDb() async {
    String? dbPath;

    try {
      // アプリケーション専用のファイル
      final directory = await getApplicationDocumentsDirectory();
      dbPath = directory.path;
    } catch(e) {
      debugPrint(e.toString());
    }

    late sql3.Database db;
    if (dbPath == null) {
      db = sql3.sqlite3.openInMemory();
    } else {
      db = sql3.sqlite3.open(join(dbPath, 'flutter_test3.db'));
    }
    return db;
  }
}