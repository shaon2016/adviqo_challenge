import 'package:adviqo_challenge/view/search/component/search_item_view.dart';
import 'package:adviqo_challenge/view/search/cubit/search_cubit.dart';
import 'package:adviqo_challenge/view/search/cubit/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../other/enums.dart';

class SearchItemListView extends StatelessWidget {
  const SearchItemListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
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
                  shrinkWrap: true,
                  itemCount: state.data.length,
                  itemBuilder: (ctx, index) {
                    context
                        .read<SearchCubit>()
                        .handlePagination(index); // doing pagination

                    if (index == state.data.length - 1) {
                      return const Align(
                        child: CircularProgressIndicator(),
                        alignment: Alignment.center,
                      );
                    }

                    return SearchItemView(item: state.data[index]);
                  });
            case DataStatus.failure:
              return const Text("Failed to load data");
          }
        },
        listener: (ctx, state) {});
  }
}
