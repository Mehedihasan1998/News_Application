import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:newapp/model/news_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewDetails extends StatefulWidget {
  WebViewDetails({Key? key, this.articles}) : super(key: key);
  Articles? articles;

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Example share',
        text: 'Example share text',
        linkUrl: '${articles!.url}',
        chooserTitle: 'Example Chooser Title'
    );
  }

  @override
  State<WebViewDetails> createState() => _WebViewDetailsState();
}

class _WebViewDetailsState extends State<WebViewDetails> {
  WebViewController ? controller  ;
  @override
  void initState() {
    // TODO: implement initState
    controller= WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(Uri.parse('${widget.articles!.url}'));
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.articles!.source!.name}"),
        actions: [
          IconButton(onPressed: (){
            widget.share();
          }, icon: Icon(Icons.share))
        ],
      ),
      body:  WebViewWidget(controller: controller!),
    );
  }
}
