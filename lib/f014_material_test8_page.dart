import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
            onNavigationRequest: (NavigationRequest request) {
              // 画面遷移を防ぐ
              if (request.url.startsWith('https://www.youtube.com/')) {
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },
          ),
        )
        ..loadRequest(Uri.parse(/*'https://flutter.dev'*/
            'https://wakizaka24.github.io/reversi/'))
    );

    useEffect(() {
      debugPrint('MaterialTest8Pageの初期化処理');
      WidgetsBinding.instance.addPostFrameCallback((_) {

      });

      return () {
        debugPrint('MaterialTest8Pageの解放処理');
      };
    }, const []);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(title),
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
      body: Column(
        children: [
          /*Consumer(
              builder: ((context, ref, child) {
                final state = ref.watch(materialTest8PageNotifierProvider);
                return */Visibility(visible: state.loading,
                    child: LinearProgressIndicator(
                  value: state.progress,
                  color: Colors.greenAccent,
                  backgroundColor: Colors.blueAccent,
                )/*);
              }*/)
          /*)*/,
          Expanded(
            child: /*Consumer(
              builder: ((context, ref, child) {
                return */WebViewWidget(
                  controller: webViewController.value,
                )/*;
              })
            )*/
          ),
        ],
      ),
    );
  }
}

class MaterialTest8PageState {
  late WebViewController webViewController;
  double progress = 0;
  bool loading = false;
  static MaterialTest8PageState copy(MaterialTest8PageState state) {
    var nState = MaterialTest8PageState();
    nState.progress = state.progress;
    nState.loading = state.loading;
    return nState;
  }
}
class MaterialTest8PageNotifier extends StateNotifier<MaterialTest8PageState> {
  final Ref ref;

  MaterialTest8PageNotifier(this.ref, MaterialTest8PageState state)
      : super(state);

  updateLoading(bool loading) {
    state.loading = loading;
    state = MaterialTest8PageState.copy(state);
  }

  updateProgress(double progress) {
    state.progress = progress;
    state = MaterialTest8PageState.copy(state);
  }
}
final materialTest8PageNotifierProvider =
StateNotifierProvider.autoDispose<MaterialTest8PageNotifier,
    MaterialTest8PageState>((ref) {
  return MaterialTest8PageNotifier(ref, MaterialTest8PageState());
});