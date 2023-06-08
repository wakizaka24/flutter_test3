import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'e002_repository/f001_test_api_data_source.dart';

class MaterialTest6Page extends HookConsumerWidget {
  const MaterialTest6Page({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(materialTest6PageNotifierProvider.notifier);
    final state = ref.watch(materialTest6PageNotifierProvider);
    List<String> list = state.uniqueIdList;

    useEffect(() {
      debugPrint("MaterialTest6Pageの初期化処理");
      notifier.loadUniqueIdList();
      return () {
        debugPrint("MaterialTest6Pageの解放処理");
      };
    }, const []);

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: [
            Container(
                color: const Color(0xCCDED2BF),
                padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16),
                child: Row(
                    children: [
                      Text(DateFormat.Hms().format(state.loadingDate),
                        style: const TextStyle(fontSize: 15,
                        fontWeight: FontWeight.w700,),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () async {
                          await notifier.getUniqueId();
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(52, 32),
                          textStyle: const TextStyle(fontSize: 13),
                          padding: const EdgeInsets.all(0),
                        ),
                        child: const Text('追加'),
                      ),
                      Container(width: 8),
                      ElevatedButton(
                        onPressed: () async {
                          await notifier.deleteFirstUniqueId();
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(52, 32),
                          textStyle: const TextStyle(fontSize: 13),
                          padding: const EdgeInsets.all(0),
                        ),
                        child: const Text('削除'),
                      ),
                    ]
                )
            ),
            Expanded(
              child: ListView(
                children: [
                  if (list.isEmpty)
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15,
                          vertical: 21),
                      child: Text('対象のデータが存在しません'),
                    ),

                  for (int i = 0; i<list.length; i++) ... {
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 21, 15, 0),
                      child: Text(list[i]),
                    ),
                  }
                ],
              ),
            ),
          ],
        )
    );
  }
}

// view_model
class MaterialTest6PageState {
  List<String> uniqueIdList = [];
  DateTime loadingDate = DateTime.now();

  static MaterialTest6PageState copy(MaterialTest6PageState state) {
    var nState = MaterialTest6PageState();
    nState.uniqueIdList = state.uniqueIdList;
    nState.loadingDate = state.loadingDate;

    return nState;
  }
}
class MaterialTest6PageNotifier extends StateNotifier<MaterialTest6PageState> {
  final uniqueIdListKey = 'unique_id_list';
  MaterialTest6PageNotifier(this.ref) : super(MaterialTest6PageState());
  final Ref ref;

  late final TestApiDataSource _apiTestInfoDataSource
    = ref.read(testApiDataSourceProvider);

  loadUniqueIdList() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String>? uniqueIdList = pref.getStringList(uniqueIdListKey);
    state.uniqueIdList = uniqueIdList ?? [];
    state = MaterialTest6PageState.copy(state);
  }

  saveUniqueIdList() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setStringList(uniqueIdListKey, state.uniqueIdList);
  }

  Future<void> getUniqueId() async {
    TestApiApi1Result result = await _apiTestInfoDataSource.getUniqueId();
    state.uniqueIdList.add(result.uniqueId);
    saveUniqueIdList();
    state = MaterialTest6PageState.copy(state);
  }

  deleteFirstUniqueId() {
    state.uniqueIdList.removeAt(0);
    saveUniqueIdList();
    state = MaterialTest6PageState.copy(state);
  }
}
final materialTest6PageNotifierProvider =
StateNotifierProvider.autoDispose<MaterialTest6PageNotifier,
    MaterialTest6PageState>((ref) {
  return MaterialTest6PageNotifier(ref);
});
