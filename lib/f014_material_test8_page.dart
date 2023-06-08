import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MaterialTest8Page extends HookConsumerWidget {
  final String title;

  const MaterialTest8Page({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(materialTest8PageNotifierProvider.notifier);
    final state = ref.watch(materialTest8PageNotifierProvider);

    useEffect(() {
      debugPrint("MaterialTest8Pageの初期化処理");
      WidgetsBinding.instance.addPostFrameCallback((_) {

      });

      return () {
        debugPrint("MaterialTest8Pageの解放処理");
      };
    }, const []);

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container()
    );
  }
}

// view_model
class MaterialTest8PageState {
  static MaterialTest8PageState copy(MaterialTest8PageState state) {
    var nState = MaterialTest8PageState();
    return nState;
  }
}
class MaterialTest8PageNotifier extends StateNotifier<MaterialTest8PageState> {
  final Ref ref;

  MaterialTest8PageNotifier(this.ref, MaterialTest8PageState state)
      : super(state);
}
final materialTest8PageNotifierProvider =
StateNotifierProvider.autoDispose<MaterialTest8PageNotifier,
    MaterialTest8PageState>((ref) {
  return MaterialTest8PageNotifier(ref, MaterialTest8PageState());
});