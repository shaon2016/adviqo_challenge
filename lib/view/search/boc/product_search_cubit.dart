import 'package:adviqo_challenge/core/pagination_handler.dart';
import 'package:adviqo_challenge/view/search/boc/product_search_state.dart';
import 'package:adviqo_challenge/view/search/repo/product_search_reoo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../other/enums.dart';

class ProductSearchCubit extends Cubit<ProductSearchState> with PaginationHandler {
  final ProductSearchRepo _repo;

  ProductSearchCubit(this._repo) : super(ProductSearchState.init());

  int _searchCurrentOffset = 1;
  String _currentSearchQuery = '';
  bool _isToShowSearchMainLoader = true;

  searchItems() async {
    if (_currentSearchQuery.isEmpty) return;

    if (_isToShowSearchMainLoader) {
      emit(state.copyWith(status: DataStatus.loading));
      _isToShowSearchMainLoader = false;
    }

    try {
      final data =
          await _repo.searchItems(_currentSearchQuery, _searchCurrentOffset++);

      emit(state.copyWith(
          data: [...state.data, ...data], status: DataStatus.success));
    } catch (e) {
      emit(state.copyWith(status: DataStatus.failure));
    }
  }

  handlePagination(int index) {
    handleScrollWithIndex(index, _searchCurrentOffset, () => searchItems());
  }

  doSearch(String searchQuery) {
    state.data.clear();
    _isToShowSearchMainLoader = true;
    _searchCurrentOffset = 1;
    _currentSearchQuery = searchQuery;

    searchItems();
  }
}
