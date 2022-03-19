import 'package:adviqo_challenge/core/app_routes.dart';
import 'package:adviqo_challenge/core/data_provider/hive_db/entity/product.dart';
import 'package:adviqo_challenge/view/detail/product_detail_page.dart';
import 'package:adviqo_challenge/view/search/product_search_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  runApp(const _MyApp());
}


initHive() async {
  await Hive.initFlutter();

  Hive.registerAdapter(ProductAdapter());
  await Product.openBox();
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
