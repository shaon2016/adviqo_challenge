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
              return Container();
            case DataStatus.failure:
              return Container();
          }
        },
        listener: (ctx, state) {});
  }
}
