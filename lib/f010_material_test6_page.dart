import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

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
// final getApiTestInfoDataSourceProvider =
// Provider<GetApiTestInfoDataSource>((ref) {
//   return GetApiTestInfoDataSource(ref);
// });
// @RestApi()
// abstract class GetApiTestInfoDataSource {
//   static const testApi1 = 'https://umayadia-apisample.azurewebsites.net'
//       '/api/persons/Shakespeare';
//
//   factory GetApiTestInfoDataSource(Ref ref) =>
//       GetApiTestInfoDataSource(ref.read());
//
// }

// setting(Widgetの状態と関係なし)
// class CustomDio with DioMixin implements Dio {
//
// }

