import 'package:adviqo_challenge/core/pagination_handler.dart';
import 'package:adviqo_challenge/view/search/cubit/search_state.dart';
import 'package:adviqo_challenge/view/search/repo/search_reoo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../other/enums.dart';

class SearchCubit extends Cubit<SearchState> with PaginationHandler {
  final SearchRepo _repo;

  SearchCubit(this._repo) : super(SearchState.init());

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
