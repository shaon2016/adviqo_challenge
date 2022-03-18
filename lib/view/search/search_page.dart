import 'package:adviqo_challenge/view/search/component/search_item_list_view.dart';
import 'package:adviqo_challenge/view/search/component/search_textfiled_area_view.dart';
import 'package:adviqo_challenge/view/search/cubit/search_cubit.dart';
import 'package:adviqo_challenge/view/search/repo/search_reoo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: BlocProvider(
        create: (ctx) => SearchCubit(SearchRepo()),
        child: const _SearchView(),
      ),
    );
  }
}

class _SearchView extends StatelessWidget {
  const _SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  const [
         SearchTextFieldAreaView(),
         SearchItemListView(),
      ],
    );
  }
}
