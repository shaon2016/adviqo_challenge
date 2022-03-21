import 'package:adviqo_challenge/view/search/boc/product_search_cubit.dart';
import 'package:adviqo_challenge/view/search/boc/product_search_state.dart';
import 'package:adviqo_challenge/view/search/component/product_search_item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../other/enums.dart';

class SearchItemListView extends StatefulWidget {
  const SearchItemListView({Key? key}) : super(key: key);

  @override
  State<SearchItemListView> createState() => _SearchItemListViewState();
}

class _SearchItemListViewState extends State<SearchItemListView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductSearchCubit, ProductSearchState>(
        builder: (ctx, state) {
          switch (state.status) {
            case DataStatus.initial:
              return Container();
            case DataStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case DataStatus.success:
              if (state.data.isEmpty) {
                return const Center(
                  child: Text("No product found"),
                );
              }
              return ListView.builder(
                  controller: context
                      .read<ProductSearchCubit>()
                      .productScrollController,
                  shrinkWrap: true,
                  itemCount: state.data.length,
                  itemBuilder: (ctx, index) {
                    bool isToLoadNextPage =
                        context.read<ProductSearchCubit>().isToLoadNextPage;

                    if (index == state.data.length - 1 && isToLoadNextPage) {
                      return const Align(
                        child: CircularProgressIndicator(),
                        alignment: Alignment.center,
                      );
                    }

                    return ProductSearchItemView(item: state.data[index]);
                  });
            case DataStatus.failure:
              return const Text("Failed to load data");
          }
        },
        listener: (ctx, state) {});
  }

  @override
  void dispose() {
    context.read<ProductSearchCubit>().productScrollController.dispose();
    super.dispose();
  }
}
