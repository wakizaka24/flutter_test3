import 'package:flutter/material.dart';

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
}