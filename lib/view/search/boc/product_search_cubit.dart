import 'package:adviqo_challenge/view/search/boc/product_search_state.dart';
import 'package:adviqo_challenge/view/search/repo/product_search_reoo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../other/enums.dart';

class ProductSearchCubit extends Cubit<ProductSearchState> {
  final ProductSearchRepo _repo;

  ProductSearchCubit(this._repo) : super(ProductSearchState.init()) {
    productScrollController.addListener(() {
      if (productScrollController.position.pixels ==
          productScrollController.position.maxScrollExtent) {
        searchItems();
      }
    });
  }

  final productScrollController = ScrollController();
  int _searchCurrentOffset = 1;
  String _currentSearchQuery = '';
  bool _isToShowSearchMainLoader = true;
  bool isToLoadNextPage = true;

  searchItems() async {
    if (_currentSearchQuery.isEmpty || !isToLoadNextPage) return;

    if (_isToShowSearchMainLoader) {
      emit(state.copyWith(status: DataStatus.loading));
      _isToShowSearchMainLoader = false;
    }

    try {
      final data =
          await _repo.searchItems(_currentSearchQuery, _searchCurrentOffset++);

      if (data.isNotEmpty) {
        emit(state.copyWith(
            data: [...state.data, ...data], status: DataStatus.success));
      } else {
        isToLoadNextPage = false;
        emit(state.copyWith(status: DataStatus.success));
      }
    } catch (e) {
      emit(state.copyWith(status: DataStatus.failure));
    }
  }

  doSearch(String searchQuery) {
    state.data.clear();
    _isToShowSearchMainLoader = true;
    _searchCurrentOffset = 1;
    isToLoadNextPage = true;
    _currentSearchQuery = searchQuery;

    searchItems();
  }

  void clearSearch() {
    emit(state.copyWith(data: [], status: DataStatus.initial));
  }
}
