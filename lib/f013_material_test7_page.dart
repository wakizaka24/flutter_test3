import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'e002_repository/f001_test_api_data_source.dart';

part 'f013_material_test7_page.freezed.dart';

/*
cd /Users/rwakizaka/pc_data/project/rwakizaka32/flutter_test3
fvm flutter pub run build_runner build --delete-conflicting-outputs
 */

class MaterialTest7Page extends HookConsumerWidget {
  final String title;

  const MaterialTest7Page({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(materialTest7PageNotifierProvider.notifier);
    final state = ref.watch(materialTest7PageNotifierProvider);
    List<String> list = state.uniqueIdList;

    useEffect(() {
      debugPrint('MaterialTest6Pageの初期化処理');

      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifier.initState();
        notifier.loadUniqueIdList();
      });

      return () {
        debugPrint('MaterialTest6Pageの解放処理');
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
                      Text(DateFormat.Hms().format(state.loadingDate!),
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
                    if (i == list.length - 1)
                      Container(width: 21),
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
@freezed
class MaterialTest7PageState with _$MaterialTest7PageState {
  const factory MaterialTest7PageState(
      {@Default([]) List<String> uniqueIdList, DateTime? loadingDate})
      = _MaterialTest7PageState;
}

class MaterialTest7PageNotifier extends StateNotifier<MaterialTest7PageState> {
  final uniqueIdListKey = 'unique_id_list';
  final Ref ref;

  MaterialTest7PageNotifier(this.ref, MaterialTest7PageState state)
      : super(state);

  late final TestApiDataSource _apiTestInfoDataSource
    = ref.read(testApiDataSourceProvider);

  initState() {
   state = state.copyWith(loadingDate: DateTime.now());
  }

  loadUniqueIdList() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String>? uniqueIdList = pref.getStringList(uniqueIdListKey);
    state = state.copyWith(uniqueIdList: uniqueIdList ?? []);
  }

  saveUniqueIdList(List<String> uniqueIdList) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setStringList(uniqueIdListKey, uniqueIdList);
  }

  Future<void> getUniqueId() async {
    TestApiApi1Result result = await _apiTestInfoDataSource.getUniqueId();
    // stateの書き込み禁止
    // state.uniqueIdList.add(result.uniqueId);
    List<String> uniqueIdList = [...state.uniqueIdList];
    uniqueIdList.add(result.uniqueId);
    // state.uniqueIdListの編集が出来ないので引数を拡張
    saveUniqueIdList(uniqueIdList);
    state = state.copyWith(uniqueIdList: uniqueIdList);
  }

  deleteFirstUniqueId() {
    if (state.uniqueIdList.isEmpty) {
      return;
    }
    // stateの書き込み禁止
    // state.uniqueIdList.removeAt(0);
    List<String> uniqueIdList = [...state.uniqueIdList];
    uniqueIdList.removeAt(0);
    // state.uniqueIdListの編集が出来ないので引数を拡張
    saveUniqueIdList(uniqueIdList);
    state = state.copyWith(uniqueIdList: uniqueIdList);
  }
}
final materialTest7PageNotifierProvider =
StateNotifierProvider.autoDispose<MaterialTest7PageNotifier,
    MaterialTest7PageState>((ref) {
  return MaterialTest7PageNotifier(ref,
      MaterialTest7PageState(loadingDate: DateTime.now()));
});