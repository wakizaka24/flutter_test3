import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MaterialTest9Page extends HookConsumerWidget {
  final String title;

  const MaterialTest9Page({super.key, required this.title});

  Widget createListView(List<TextEditingController> controllers) {
    final context = useContext();
    return GestureDetector(
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
              for (int i = 0; i < controllers.length / 2; i = i + 2) ... {
                TextField(
                  controller: controllers[i],
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
                  controller: controllers[i + 1],
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
              }
            ]
        )
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final state = ref.watch(materialTest9PageNotifierProvider);
    final notifier = ref.watch(materialTest9PageNotifierProvider.notifier);

    useEffect(() {
      debugPrint('MaterialTest9Pageの初期化処理');
      WidgetsBinding.instance.addPostFrameCallback((_) {
      });

      return () {
        debugPrint('MaterialTest9Pageの解放処理');
      };
    }, const []);

    final mainTextFieldControllers = useState([
      for (int i = 0; i < 15 * 2; i++) ... {
        TextEditingController(),
      }
    ]);

    final halfModalTextFieldControllers = useState([
      for (int i = 0; i < 15 * 2; i++) ... {
        TextEditingController(),
      }
    ]);

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
      body: SafeArea(child:
          // TODO: キーボードでずれてしまう。https://hiyoko-programming.com/1694/
        Column(children: [
          Expanded(child: createListView(mainTextFieldControllers.value)),

          Container(
            color: theme.colorScheme.background,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 3),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 700,
                          color: theme.colorScheme.background,
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(150, 32),
                    textStyle: const TextStyle(fontSize: 13),
                    padding: const EdgeInsets.all(0),
                  ),
                  child: const Text('モーダル表示'),
                ),
              ],
            ),
          )
        ])
      )
    );
  }
}

// view_model
class MaterialTest9PageState {
  static MaterialTest9PageState copy(MaterialTest9PageState state) {
    var nState = MaterialTest9PageState();
    return nState;
  }
}
class MaterialTest9PageNotifier extends StateNotifier<MaterialTest9PageState> {
  final Ref ref;

  MaterialTest9PageNotifier(this.ref, MaterialTest9PageState state)
      : super(state);

  updateState() {
    state = MaterialTest9PageState.copy(state);
  }
}
final materialTest9PageNotifierProvider =
StateNotifierProvider.autoDispose<MaterialTest9PageNotifier,
    MaterialTest9PageState>((ref) {
  return MaterialTest9PageNotifier(ref, MaterialTest9PageState());
});