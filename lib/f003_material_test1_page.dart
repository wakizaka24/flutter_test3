import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ページ
// Stateオブジェクトを持ち。Stateオブジェクトは外観に影響を与える。
class MaterialTest1Page extends StatefulWidget {
  const MaterialTest1Page({super.key, required this.title});
  final String title;

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

  List<DateTime> dateTimes = [
    for (int i = 0; i<32; i++) ... {
      DateTime.now()
    }
  ];

  List<TextEditingController> textFieldControllers = [
    for (int i = 0; i<32; i++) ... {
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
        onTap: () => FocusScope.of(context).unfocus(),
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.only(
            left: 16,
            top:16,
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
                    style: TextButton.styleFrom(
                        fixedSize: const Size(150, 32),
                        textStyle: const TextStyle(fontSize: 15)),
                    onPressed: () {
                    },
                    child: const Text('TextButton'),
                  ),
                  Container(width: 8),
                  OutlinedButton(
                    style: TextButton.styleFrom(
                        fixedSize: const Size(150, 32),
                        textStyle: const TextStyle(fontSize: 15)),
                    onPressed: () {
                    },
                    child: const Text('OutlinedButton'),
                  ),
                  Container(width: 8),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                        fixedSize: const Size(150, 32),
                        textStyle: const TextStyle(fontSize: 15)),
                    onPressed: () {
                    },
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
                      final DateTime? datePicked = await showDatePicker(
                        context: context,
                        initialDate: dateTime,
                        firstDate: DateTime(2021),
                        lastDate: DateTime(2100),
                      );
                      if (datePicked != null) {
                        setState(() {
                          dateTime = datePicked;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                        buttonFitSize,
                        32,
                      ),
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
                    ),
                    child: const Text('時刻の選択'),
                  ),
                ]
              ),

            Container(height: 32),

            for (int i=0; i < dateTimes.length; i++) ... {
              Visibility(
                visible: i == 0,
                child: const Text('スクロール検証',
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
                        final DateTime? datePicked = await showDatePicker(
                          context: context,
                          initialDate: dateTimes[i],
                          firstDate: DateTime(2021),
                          lastDate: DateTime(2100),
                        );
                        if (datePicked != null) {
                          setState(() {
                            dateTimes[i] = datePicked;
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(
                          buttonFitSize,
                          32,
                        ),
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
        onPressed: () {
          setState(() {
            //_counter++;
          });
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