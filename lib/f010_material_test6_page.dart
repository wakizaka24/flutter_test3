import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'f010_material_test6_page.g.dart';
/*
cd /Users/rwakizaka/pc_data/project/rwakizaka32/flutter_test3
fvm flutter pub run build_runner build
 */

class MaterialTest6Page extends HookConsumerWidget {
  const MaterialTest6Page({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> list = [];
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
                    onPressed: () {
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

  

}
class MaterialTest6PageState {

}
final materialTest6PageNotifierProvider =
StateNotifierProvider.autoDispose<MaterialTest6PageNotifier,
    MaterialTest6PageState>((ref) {
  return MaterialTest6PageNotifier(ref);
});

// repository
@RestApi(baseUrl: 'https://wakizaka24.sakura.ne.jp/reversi/php')
abstract class GetApiTestInfoDataSource {
  // static const testApi1 = 'https://wakizaka24.sakura.ne.jp/reversi/php'
  //     '/api1_get_unique_id.php';

  factory GetApiTestInfoDataSource(Ref ref) =>
      _GetApiTestInfoDataSource(ref.read(dioProvider));

  @GET("/api1_get_unique_id.php")
  Future<Api1Result> getUniqueId();
}
@JsonSerializable()
class Api1Result {
  Api1Result({required this.uniqueId});

  String uniqueId;
  factory Api1Result.fromJson(Map<String, dynamic> json) => _$Api1ResultFromJson(json);
  Map<String, dynamic> toJson() => _$Api1ResultToJson(this);
}
final getApiTestInfoDataSourceProvider =
Provider<GetApiTestInfoDataSource>((ref) {
  return GetApiTestInfoDataSource(ref);
});

// setting
class CustomDio with DioMixin implements Dio {
  static final CustomDio _instance = CustomDio._internal();
  CustomDio._internal();

  factory CustomDio() {
    return _instance;
  }
}
final dioProvider = Provider((_) => CustomDio());

