import 'package:adviqo_challenge/view/detail/bloc/product_detail_cubit.dart';
import 'package:adviqo_challenge/view/detail/repo/product_detail_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'component/product_detail_view.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String productId =
        ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: BlocProvider(
        create: (ctx) => ProductDetailCubit(ProductDetailRepo(), productId),
        child: const ProductDetailView(),
      ),
    );
  }
}
