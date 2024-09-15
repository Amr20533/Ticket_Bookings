import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/core/const/routes.dart';
import 'package:ticket_booking_app/providers/hotels_notifier.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    final HotelsNotifier hotelsNotifier = Provider.of<HotelsNotifier>(context, listen: false);



    late PlatformWebViewControllerCreationParams params = const PlatformWebViewControllerCreationParams();
    final WebViewController controller =
    WebViewController.fromPlatformCreationParams(params);
    // #enddocregion platform_features

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            // debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            // debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
                Page resource error:
                  code: ${error.errorCode}
                  description: ${error.description}
                  errorType: ${error.errorType}
                  isForMainFrame: ${error.isForMainFrame}
                          ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              debugPrint('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },

          onUrlChange: (UrlChange change) {
            if(change.url!.contains('acceptance')){
              Navigator.pushReplacementNamed(context, AppRoutes.main);
              HotelsNotifier().paymentGateway = '';
            }else if(change.url!.contains('cancel')){
              Navigator.pushReplacementNamed(context, AppRoutes.main);
              HotelsNotifier().paymentGateway = '';

              }
            },
              onHttpAuthRequest: (HttpAuthRequest request) {
            // openDialog(request);
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..loadRequest(Uri.parse(hotelsNotifier.paymentGateway));


    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: _controller),
    );
  }
}
