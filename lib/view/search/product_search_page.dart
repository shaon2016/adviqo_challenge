import 'package:adviqo_challenge/view/search/component/product_search_item_list_view.dart';
import 'package:adviqo_challenge/view/search/component/product_search_textfiled_area_view.dart';
import 'package:adviqo_challenge/view/search/repo/product_search_reoo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/product_search_cubit.dart';

class ProductSearchPage extends StatelessWidget {
  const ProductSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: BlocProvider(
        create: (ctx) => ProductSearchCubit(ProductSearchRepo()),
        child: const _ProductSearchView(),
      ),
    );
  }
}

class _ProductSearchView extends StatelessWidget {
  const _ProductSearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  const [
         SearchTextFieldAreaView(),
         Expanded(child: SearchItemListView()),
      ],
    );
  }
}
