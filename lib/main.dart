import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokosepatu/view/Store_Page/store_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: store_page(),
    );
  }
}
