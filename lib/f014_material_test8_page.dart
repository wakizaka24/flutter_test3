import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'f005_app_common.dart';

class MaterialTest8Page extends HookConsumerWidget {
  final String title;

  const MaterialTest8Page({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(materialTest8PageNotifierProvider);
    final notifier = ref.watch(materialTest8PageNotifierProvider.notifier);
    final webViewController = useState(
        WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(const Color(0x00000000))
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              notifier.updateProgress(progress / 100);
              debugPrint('progress=$progress');
            },
            onPageStarted: (String url) {
              notifier.updateLoading(true);
            },
            onPageFinished: (String url) {
              notifier.updateLoading(false);
            },
            onWebResourceError: (WebResourceError error) {},
            onNavigationRequest: (NavigationRequest request) async {
              // ページ遷移を防ぐ
              if (request.url.startsWith('https://www.youtube.com/')) {
                await AppCommon()
                    .showMessageDialog(context, 'WebViewの検証',
                    'ページ遷移を防ぎました', true, 'OK');
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },
          ),
        )
    );

    useEffect(() {
      debugPrint('MaterialTest8Pageの初期化処理');
      WidgetsBinding.instance.addPostFrameCallback((_) {
        webViewController.value.loadRequest(
            Uri.parse(state.actionList[state.selectIndex].url));
      });

      return () {
        debugPrint('MaterialTest8Pageの解放処理');
      };
    }, const []);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(title),
          elevation: state.actionList[state.selectIndex].appBarElevation,
          actions: [
            IconButton(
              onPressed: () async {
                if (await webViewController.value.canGoBack()) {
                  webViewController.value.goBack();
                }
              },
              icon: const Icon(Icons.arrow_back),
            ),
            IconButton(
              onPressed: () {
                webViewController.value.reload();
              },
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
      body: SafeArea(child:
        Column(
          children: [
            Consumer(
                builder: ((context, ref, child) {
                  final state = ref.watch(materialTest8PageNotifierProvider);
                  return Visibility(visible: state.loading,
                      child: LinearProgressIndicator(
                    value: state.progress,
                    color: Colors.greenAccent,
                    backgroundColor: Colors.blueAccent,
                  ));
                })
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(child: Consumer(
                      builder: ((context, ref, child) {
                        return WebViewWidget(
                          controller: webViewController.value,
                        );
                      })
                  )),
                  Container(
                      color: Colors.blueGrey,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            for (int i = 0; i < state.actionList.length; i++) ... {
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4), child: ElevatedButton(
                                onPressed: () {
                                  state.selectIndex = i;
                                  webViewController.value.loadRequest(
                                      Uri.parse(state.actionList[
                                      state.selectIndex].url));
                                  notifier.updateState();
                                },
                                style: ElevatedButton.styleFrom(
                                  textStyle: const TextStyle(fontSize: 13),
                                ),
                                child: Text(state.actionList[i].url),
                              )
                              ),
                            }
                          ],
                        ),
                      )
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}

// view_model
class MaterialTest8PageState {
  late WebViewController webViewController;
  List<UrlButtonAction> actionList = [
    UrlButtonAction(
      appBarElevation: 10, url: 'https://flutter.dev'),
    UrlButtonAction(
        appBarElevation: 10, url: 'https://wakizaka24.github.io/reversi'),
    UrlButtonAction(
      appBarElevation: 0, url: 'https://wakizaka24.sakura.ne.jp/scal'
        '/deploy/demo1'),
  ];
  int selectIndex = 0;
  double progress = 0;
  bool loading = false;
  static MaterialTest8PageState copy(MaterialTest8PageState state) {
    var nState = MaterialTest8PageState();
    nState.selectIndex = state.selectIndex;
    nState.actionList = state.actionList;
    nState.progress = state.progress;
    nState.loading = state.loading;
    return nState;
  }
}
class UrlButtonAction {
  double appBarElevation;
  String url;

  UrlButtonAction({
    required this.appBarElevation,
    required this.url,
  });
}
class MaterialTest8PageNotifier extends StateNotifier<MaterialTest8PageState> {
  final Ref ref;

  MaterialTest8PageNotifier(this.ref, MaterialTest8PageState state)
      : super(state);

  updateLoading(bool loading) {
    state.loading = loading;
    updateState();
  }

  updateProgress(double progress) {
    state.progress = progress;
    updateState();
  }

  updateState() {
    state = MaterialTest8PageState.copy(state);
  }
}
final materialTest8PageNotifierProvider =
StateNotifierProvider.autoDispose<MaterialTest8PageNotifier,
    MaterialTest8PageState>((ref) {
  return MaterialTest8PageNotifier(ref, MaterialTest8PageState());
});