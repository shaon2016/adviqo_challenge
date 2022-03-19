import 'package:adviqo_challenge/core/app_routes.dart';
import 'package:adviqo_challenge/view/detail/product_detail_page.dart';
import 'package:adviqo_challenge/view/search/product_search_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const _MyApp());
}

class _MyApp extends StatelessWidget {
  const _MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Challenge App',
      home: const ProductSearchPage(),
      routes: {
        AppRoute.searchPage: (ctx) => const ProductSearchPage(),
        AppRoute.detailPage: (ctx) => const ProductDetailPage(),
      },
    );
  }
}
