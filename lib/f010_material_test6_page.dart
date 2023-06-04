import 'package:dio/io.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'f010_material_test6_page.g.dart';
/*
cd /Users/rwakizaka/pc_data/project/rwakizaka32/flutter_test3
fvm flutter pub run build_runner build --delete-conflicting-outputs
 */

class MaterialTest6Page extends HookConsumerWidget {
  const MaterialTest6Page({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(materialTest6PageNotifierProvider.notifier);
    final state = ref.watch(materialTest6PageNotifierProvider);
    List<String> list = state.uniqueIdList;

    debugPrint("list=${state.uniqueIdList}");

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
                  const Text('タイトル', style: TextStyle(fontSize: 15,
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
                    onPressed: () {
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

          if (list.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 32.0),
              child: Text("対象のデータが存在しません"),
            ),


        ],
      ),
    );
  }
}

// view_model
class MaterialTest6PageNotifier extends StateNotifier<MaterialTest6PageState> {
  MaterialTest6PageNotifier(this.ref) : super(MaterialTest6PageState());
  final Ref ref;

  late final TestApiDataSource _apiTestInfoDataSource =
    ref.read(testApiDataSourceProvider);

  Future<void> getUniqueId() async {
    TestApiApi1Result result = await _apiTestInfoDataSource.getUniqueId();
    // state.uniqueIdList.add(result.uniqueId);
    // MaterialTest6PageState a = MaterialTest6PageState();
    state = MaterialTest6PageState();
    state.uniqueIdList = [result.uniqueId];



  }
}
class MaterialTest6PageState {
  List<String> uniqueIdList = [];
}
final materialTest6PageNotifierProvider =
StateNotifierProvider.autoDispose<MaterialTest6PageNotifier,
    MaterialTest6PageState>((ref) {
  return MaterialTest6PageNotifier(ref);
});

// repository
@RestApi()
abstract class TestApiDataSource {
  factory TestApiDataSource(Ref ref) =>
      _TestApiDataSource(ref.read(testApiDioProvider));

  @GET("/api1_get_unique_id.php")
  Future<TestApiApi1Result> getUniqueId();
}
@JsonSerializable()
class TestApiApi1Result {
  TestApiApi1Result({required this.uniqueId});

  @JsonKey(name: "unique_id") String uniqueId;
  factory TestApiApi1Result.fromJson(Map<String, dynamic> json)
  => _$TestApiApi1ResultFromJson(json);
  Map<String, dynamic> toJson() => _$TestApiApi1ResultToJson(this);
}
final testApiDataSourceProvider =
Provider<TestApiDataSource>((ref) {
  return TestApiDataSource(ref);
});

// setting
class TestApiDio with DioMixin implements Dio {
  static final TestApiDio _instance = TestApiDio._internal();

  factory TestApiDio() {
    return _instance;
  }

  TestApiDio._internal([BaseOptions? options]) {
    httpClientAdapter = IOHttpClientAdapter();
    options = BaseOptions(
        baseUrl: "https://wakizaka24.sakura.ne.jp/reversi/php",
        headers: {"Content-Type": "application/json",});

    this.options = options;
  }
}
final testApiDioProvider = Provider((_) => TestApiDio());

