import 'package:adviqo_challenge/view/detail/bloc/product_detail_cubit.dart';
import 'package:adviqo_challenge/view/detail/repo/product_detail_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'component/product_detail_view.dart';

class ProductDetailPage extends StatelessWidget {
  final String productId;

  const ProductDetailPage({Key? key, required this.productId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: BlocProvider(
        create: (ctx) => ProductDetailCubit(
          ProductDetailRepo(productId),
        ),
        child: const ProductDetailView(),
      ),
    );
  }
}
