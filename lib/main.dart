import 'package:adviqo_challenge/view/search/product_search_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const _MyApp());
}

class _MyApp extends StatelessWidget {
  const _MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Challenge App',
      home: ProductSearchPage(),);
  }
}
