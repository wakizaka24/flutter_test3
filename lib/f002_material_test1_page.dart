import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_test3/f005_app_common.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test3/e001_export/sqlite3_export.dart' as sql3;
import 'package:shared_preferences/shared_preferences.dart';

// ページ
// Stateオブジェクトを持ち。Stateオブジェクトは外観に影響を与える。
class MaterialTest1Page extends StatefulWidget {
  const MaterialTest1Page({super.key, required this.heroTag});
  final String heroTag;

  @override
  State<MaterialTest1Page> createState() => _MaterialTest1PageState();
}

// 状態
class _MaterialTest1PageState extends State<MaterialTest1Page>
    with AutomaticKeepAliveClientMixin {

  final textField1Controller = TextEditingController();
  final textField2Controller = TextEditingController();
  var switch1Value = false;
  var switch2Value = false;
  var switch3Value = false;
  DateTime dateTime = DateTime.now();

  static const dataNum = 32;
  static const testApi1 = 'https://wakizaka24.sakura.ne.jp/reversi'
      '/php/api1_get_unique_id.php';
  // static const testApi1 = 'https://umayadia-apisample.azurewebsites.net'
  //     '/api/persons/Shakespeare';

  List<DateTime> dateTimes = [
    for (int i = 0; i<dataNum; i++) ... {
      DateTime.now()
    }
  ];

  List<TextEditingController> textFieldControllers = [
    for (int i = 0; i<dataNum; i++) ... {
      TextEditingController()
    }
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);

    var screenSize = MediaQuery.of(context).size;
    var contentWidth = screenSize.width - 32;
    const buttonSpace = 8;
    var buttonFitSize = (contentWidth - buttonSpace * 2) / 3;

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          final FocusScopeNode focusScope = FocusScope.of(context);
          if (!focusScope.hasPrimaryFocus && focusScope.hasFocus) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.only(
            left: 16,
            top: 16,
            right: 16,
            bottom: 16,
          ),
          children: [
            // Container(height: 32),

            const Text('Textの検証',
                style: TextStyle(fontSize: 15)),

            Container(height: 8),

            const Text('1行目\n2行目\n3行目',
                style: TextStyle(fontSize: 15)),

            Container(height: 8),

            const Text('TextFieldの検証',
                style: TextStyle(fontSize: 15)),

            Container(height: 8),

            TextField(
              controller: textField1Controller,
              style: const TextStyle(fontSize: 15),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(8),
                border: OutlineInputBorder(),
                hintText: '宛先',
              ),
              onChanged: (text) {
                debugPrint("Textの変更検知={$text}");
              },
            ),

            Container(height: 8),

            TextField(
              controller: textField2Controller,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: const TextStyle(fontSize: 15),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(8),
                border: OutlineInputBorder(),
                hintText: '本文\n\n\n\n\n',
              ),
              onChanged: (text) {
                debugPrint("Textの変更検知={$text}");
              },
            ),

            Container(height: 8),

            const Text('Buttonの検証',
                style: TextStyle(fontSize: 15)),

            Container(height: 8),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                    },
                    style: TextButton.styleFrom(
                        fixedSize: const Size(150, 32),
                        textStyle: const TextStyle(fontSize: 13),
                        padding: const EdgeInsets.all(0),
                    ),
                    child: const Text('TextButton'),
                  ),
                  Container(width: 8),
                  OutlinedButton(
                    onPressed: () {
                    },
                    style: OutlinedButton.styleFrom(
                        fixedSize: const Size(150, 32),
                        textStyle: const TextStyle(fontSize: 13),
                        padding: const EdgeInsets.all(0),
                    ),
                    child: const Text('OutlinedButton'),
                  ),
                  Container(width: 8),
                  ElevatedButton(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(150, 32),
                        textStyle: const TextStyle(fontSize: 13),
                        padding: const EdgeInsets.all(0),
                    ),
                    child: const Text('ElevatedButton'),
                  ),
                ],
              ),
            ),

            Container(height: 8),

            Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                        buttonFitSize,
                        52,
                      ),
                      textStyle: const TextStyle(fontSize: 13),
                      padding: const EdgeInsets.all(0),
                    ),
                    child: const Text('TextButton'),
                  ),
                  const Spacer(),
                  OutlinedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                        buttonFitSize,
                        52,
                      ),
                      textStyle: const TextStyle(fontSize: 13),
                      padding: const EdgeInsets.all(0),
                    ),
                    child: const Text('OutlinedButton'),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                        buttonFitSize,
                        52,
                      ),
                      textStyle: const TextStyle(fontSize: 13),
                      padding: const EdgeInsets.all(0),
                    ),
                    child: const Text('ElevatedButton'),
                  ),
                ]
            ),

            Container(height: 8),

            const Text('Switchの検証',
                style: TextStyle(fontSize: 15)),

            Container(height: 8),

            Row(
              children: [
                Switch(
                  value: switch1Value,
                  onChanged: (bool? value) {
                    if (value == null) return;
                    setState(() {
                      switch1Value = value;
                    });
                  },
                ),
                Switch(
                  value: switch2Value,
                  onChanged: (bool? value) {
                    if (value == null) return;
                    setState(() {
                      switch2Value = value;
                    });
                  },
                ),
                Switch(
                  value: switch3Value,
                  onChanged: (bool? value) {
                    if (value == null) return;
                    setState(() {
                      switch3Value = value;
                    });
                  },
                ),
              ]
            ),

            Container(height: 8),

            const Text('DatePicker、TimePickerの検証',
                style: TextStyle(fontSize: 15)),

            Container(height: 8),

            Text(DateFormat.yMMMd().add_Hm().format(dateTime),
                style: const TextStyle(fontSize: 15)),

            Container(height: 8),

            Row(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      final DateTime? day = await showDatePicker(
                        context: context,
                        initialDate: dateTime,
                        firstDate: DateTime(2021),
                        lastDate: DateTime(2100),
                      );
                      if (day != null) {
                        setState(() {
                          dateTime = DateTime(
                              day.year, day.month,
                              day.day, dateTime.hour,
                              dateTime.minute);
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                        buttonFitSize,
                        32,
                      ),
                      textStyle: const TextStyle(fontSize: 13),
                      padding: const EdgeInsets.all(0),
                    ),
                    child: const Text('日付の選択'),
                  ),
                  Container(width: 8),
                  ElevatedButton(
                    onPressed: () async {
                      TimeOfDay? time = TimeOfDay(hour: dateTime.hour,
                          minute: dateTime.minute);
                      time = await showTimePicker(
                        context: context,
                        initialTime: time);
                      if (time != null) {
                        setState(() {
                          dateTime = DateTime(
                            dateTime.year, dateTime.month,
                            dateTime.day, time!.hour,
                              time.minute);
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                        buttonFitSize,
                        32,
                      ),
                      textStyle: const TextStyle(fontSize: 13),
                      padding: const EdgeInsets.all(0),
                    ),
                    child: const Text('時刻の選択'),
                  ),
                ]
              ),

            Container(height: 8),

            const Text('AlertDialogの検証',
                style: TextStyle(fontSize: 15)),

            Container(height: 8),

            Row(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      String? result = await AppCommon()
                          .showMessageDialog(context, 'AlertDialogの検証',
                          'メッセージ');
                      if (!mounted) return;
                      await AppCommon()
                          .showMessageDialog(context, 'AlertDialogの検証',
                          'メッセージの戻り値：$result', true, 'OK');
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                        buttonFitSize,
                        32,
                      ),
                      textStyle: const TextStyle(fontSize: 13),
                      padding: const EdgeInsets.all(0),
                    ),
                    child: const Text('開く'),
                  ),
                ]
            ),

            Container(height: 8),

            const Text('Httpの検証',
                style: TextStyle(fontSize: 15)),

            Container(height: 8),

            Row(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      // if (kIsWeb) {
                      //   await AppCommon()
                      //       .showMessageDialog(context, 'Httpの検証',
                      //       'HttpはWeb環境に対応していません',
                      //       true, 'OK');
                      //   return;
                      // }

                      // http://localhost
                      var response = await http.get(Uri.parse(testApi1));
                      var responseStr = 'API GET $testApi1\n'
                          'Response ${response.statusCode}'
                          ' ${response.body}';
                      debugPrint(responseStr);
                      if (!mounted) return;
                      await AppCommon()
                          .showMessageDialog(context, 'Httpの検証',
                          responseStr, true, 'OK');
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                        buttonFitSize,
                        32,
                      ),
                      textStyle: const TextStyle(fontSize: 13),
                      padding: const EdgeInsets.all(0),
                    ),
                    child: const Text('API呼び出し'),
                  ),
                ]
            ),

            Container(height: 8),

            const Text('SQLite3の検証',
                style: TextStyle(fontSize: 15)),

            Container(height: 8),

            Row(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      if (kIsWeb) {
                        await AppCommon()
                            .showMessageDialog(context, 'SQLite3の検証',
                            'SQLite3はWeb環境に対応していません',
                            true, 'OK');
                        return;
                      }

                      sql3.Database? db;
                      try {
                        // CREATE TABLE,
                        db = await AppCommon().getDb();
                        db.execute(
                            'CREATE TABLE `TEST1_TABLE` ('
                            '`COLUM1` INT NOT NULL PRIMARY KEY,'
                            '`COLUM2` VARCHAR(256) NULL'
                            ');'
                            'CREATE INDEX `TEST1_TABLE_COLUM1_INDEX`'
                            'ON `TEST1_TABLE`(`COLUM1`);');

                        // INSERT, UPDATE, DELETE,
                        var statement = db.prepare('INSERT INTO `TEST1_TABLE`'
                            '(`COLUM1`, `COLUM2`) VALUES (?, ?)');
                        statement
                          ..execute([1, 'The Beatles'])
                          ..execute([2, 'Led Zeppelin'])
                          ..execute([3, 'The Who'])
                          ..execute([4, 'Nirvana']);
                        statement.dispose();

                        statement = db.prepare('UPDATE `TEST1_TABLE`'
                            'SET `COLUM2` = ? WHERE `COLUM1` = ?');
                        statement
                            .execute(['The Beatles', 3]);
                        statement.dispose();

                        statement = db.prepare('DELETE FROM `TEST1_TABLE`'
                            'WHERE `COLUM1` = ?');
                        statement
                            .execute([4]);
                        statement.dispose();

                        db.dispose();
                      } catch (e) {
                        db?.dispose();
                        var log = 'ステートメント実行に失敗しました\n$e';
                        debugPrint(log);
                        await AppCommon()
                            .showMessageDialog(context, 'SQLite3の検証',
                            log, true, 'OK');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                        buttonFitSize,
                        32,
                      ),
                      textStyle: const TextStyle(fontSize: 13),
                      padding: const EdgeInsets.all(0),
                    ),
                    child: const Text('CREATE'),
                  ),

                  const Spacer(),

                  ElevatedButton(
                    onPressed: () async {
                      if (kIsWeb) {
                        await AppCommon()
                            .showMessageDialog(context, 'SQLite3の検証',
                            'SQLite3はWeb環境に対応していません',
                            true, 'OK');
                        return;
                      }

                      sql3.Database? db;
                      try {
                        db = await AppCommon().getDb();
                        // SELECT
                        final sql3.ResultSet resultSet =
                        db.select('SELECT * FROM `TEST1_TABLE` '
                            'WHERE `COLUM2` LIKE ?', ['The %']);
                        for (final sql3.Row row in resultSet) {
                          if (!mounted) return;
                          await AppCommon()
                              .showMessageDialog(context, 'SQLite3の検証',
                              'TEST1_TABLE[COLUM1: ${row['COLUM1']},'
                                  ' COLUM1: ${row['COLUM2']}]',
                              true, 'OK');
                          if (!mounted) return;
                        }
                        db.dispose();
                      } catch (e) {
                        db?.dispose();
                        var log = 'ステートメント実行に失敗しました\n$e';
                        debugPrint(log);
                        await AppCommon()
                            .showMessageDialog(context, 'SQLite3の検証',
                            log, true, 'OK');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                        buttonFitSize,
                        32,
                      ),
                      textStyle: const TextStyle(fontSize: 13),
                      padding: const EdgeInsets.all(0),
                    ),
                    child: const Text('SELECT'),
                  ),

                  const Spacer(),

                  ElevatedButton(
                    onPressed: () async {
                      if (kIsWeb) {
                        await AppCommon()
                            .showMessageDialog(context, 'SQLite3の検証',
                            'SQLite3はWeb環境に対応していません',
                            true, 'OK');
                        return;
                      }

                      sql3.Database? db;
                      try {
                        db = await AppCommon().getDb();
                        // DROP TABLE
                        db.execute(
                            'DROP TABLE IF EXISTS `TEST1_TABLE`;');
                        db.dispose();
                      } catch (e) {
                        db?.dispose();
                        var log = 'ステートメント実行に失敗しました\n$e';
                        debugPrint(log);
                        await AppCommon()
                            .showMessageDialog(context, 'SQLite3の検証',
                            'ステートメントの実行に失敗しました\n$e',
                            true, 'OK');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                        buttonFitSize,
                        32,
                      ),
                      textStyle: const TextStyle(fontSize: 13),
                      padding: const EdgeInsets.all(0),
                    ),
                    child: const Text('DROP'),
                  ),
                ]
            ),

            Container(height: 8),

            const Text('SharedPreferencesの検証',
                style: TextStyle(fontSize: 15)),

            Container(height: 8),

            Row(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      final SharedPreferences pref = await SharedPreferences
                          .getInstance();
                      await pref.setInt('counter', 10);
                      await pref.setBool('repeat', true);
                      await pref.setDouble('decimal', 1.5);
                      await pref.setString('action', 'Start');
                      await pref.setStringList('items', <String>['Earth',
                        'Moon', 'Sun']);
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                        buttonFitSize,
                        32,
                      ),
                      textStyle: const TextStyle(fontSize: 13),
                      padding: const EdgeInsets.all(0),
                    ),
                    child: const Text('Write'),
                  ),

                  const Spacer(),

                  ElevatedButton(
                    onPressed: () async {
                      final SharedPreferences pref = await SharedPreferences
                          .getInstance();
                      final int? counter = pref.getInt('counter');
                      final bool? repeat = pref.getBool('repeat');
                      final double? decimal = pref.getDouble('decimal');
                      final String? action = pref.getString('action');
                      final List<String>? items = pref.getStringList('items');
                      if (!mounted) return;
                      await AppCommon()
                          .showMessageDialog(context, 'SharedPreferencesの検証',
                          'counter=$counter, repeat=$repeat, decimal=$decimal, '
                              'action=$action, items=$items', true, 'OK');
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                        buttonFitSize,
                        32,
                      ),
                      textStyle: const TextStyle(fontSize: 13),
                      padding: const EdgeInsets.all(0),
                    ),
                    child: const Text('Read'),
                  ),

                  const Spacer(),

                  ElevatedButton(
                    onPressed: () async {
                      final SharedPreferences prefs = await SharedPreferences
                          .getInstance();
                      await prefs.remove('counter');
                      await prefs.remove('repeat');
                      await prefs.remove('decimal');
                      await prefs.remove('action');
                      await prefs.remove('items');
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                        buttonFitSize,
                        32,
                      ),
                      textStyle: const TextStyle(fontSize: 13),
                      padding: const EdgeInsets.all(0),
                    ),
                    child: const Text('Remove'),
                  ),
                ]
            ),

            Container(height: 8),




            Container(height: 300),

            for (int i=0; i<dataNum; i++) ... {
              Visibility(
                visible: i == 0,
                child: const Text('ListViewのスクロール検証',
                    style: TextStyle(fontSize: 15)),
              ),
              // --- copy ---
              Container(height: 8),
              TextField(
                controller: textFieldControllers[i],
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: const TextStyle(fontSize: 15),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  border: OutlineInputBorder(),
                  hintText: '本文\n\n\n\n\n',
                ),
              ),

              Container(height: 8),
              Text(DateFormat.yMMMd().add_Hm().format(dateTimes[i]),
                  style: const TextStyle(fontSize: 15)),
              Container(height: 8),
              Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final DateTime? day = await showDatePicker(
                          context: context,
                          initialDate: dateTimes[i],
                          firstDate: DateTime(2021),
                          lastDate: DateTime(2100),
                        );
                        if (day != null) {
                          setState(() {
                            dateTimes[i] = DateTime(
                              day.year, day.month,
                              day.day, dateTimes[i].hour,
                              dateTimes[i].minute);
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(
                          buttonFitSize,
                          32,
                        ),
                        textStyle: const TextStyle(fontSize: 13),
                        padding: const EdgeInsets.all(0),
                      ),
                      child: const Text('日付の選択'),
                    ),
                    Container(width: 8),
                    ElevatedButton(
                      onPressed: () async {
                        TimeOfDay? time = TimeOfDay(hour: dateTimes[i].hour,
                            minute: dateTimes[i].minute);
                        time = await showTimePicker(
                            context: context,
                            initialTime: time);
                        if (time != null) {
                          setState(() {
                            dateTimes[i] = DateTime(
                                dateTimes[i].year, dateTimes[i].month,
                                dateTimes[i].day, time!.hour,
                                time.minute);
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(
                          buttonFitSize,
                          32,
                        ),
                        textStyle: const TextStyle(fontSize: 13),
                        padding: const EdgeInsets.all(0),
                      ),
                      child: const Text('時刻の選択'),
                    ),
                  ]
              ),
            }

          ]
        ),
      ),

      floatingActionButton: FloatingActionButton(
        heroTag: widget.heroTag,
        onPressed: () {
        },
        tooltip: 'インクリメント',
        child: const Icon(Icons.add),
      ),
    );
  }

  // AutomaticKeepAliveClientMixinを拡張することで、
  // タブバーで値を保持することができる。
  @override
  bool get wantKeepAlive => true;
}