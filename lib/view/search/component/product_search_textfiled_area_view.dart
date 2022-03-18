import 'package:adviqo_challenge/util/view_util.dart';
import 'package:adviqo_challenge/view/search/boc/product_search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchTextFieldAreaView extends StatefulWidget {
  const SearchTextFieldAreaView({Key? key}) : super(key: key);

  @override
  State<SearchTextFieldAreaView> createState() =>
      _SearchTextFieldAreaViewState();
}

class _SearchTextFieldAreaViewState extends State<SearchTextFieldAreaView> {
  final _searchTextController = TextEditingController();

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchTextController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Search",
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              ViewUtil.hideKeyboard(context);
              final searchQuery = _searchTextController.text.toString();
              context.read<ProductSearchCubit>().doSearch(searchQuery);
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
    );
  }
}
