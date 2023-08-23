import '../../../libraries.dart';

class WebViewScreen extends StatelessWidget {
  WebViewScreen({super.key});
  final String url = Get.arguments[0];
  final String title = Get.arguments[1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: WebView(url: url),
    );
  }
}
