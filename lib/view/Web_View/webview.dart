import 'package:flutter/material.dart';
import 'package:tokosepatu/view/Web_View/web_page.dart';

class webview extends StatelessWidget {
  const webview({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: WebviewPage(),
    );
  }
}
