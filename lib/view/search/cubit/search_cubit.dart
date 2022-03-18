
import 'package:adviqo_challenge/view/search/cubit/search_state.dart';
import 'package:adviqo_challenge/view/search/repo/search_reoo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../other/enums.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo _repo;

  SearchCubit(this._repo) : super(SearchState.init());

  fetchBloodDonor() async {
    emit(state.copyWith(status: DataStatus.loading));

    try {
      final data = await _repo.search();

      emit(state.copyWith(
          data: [...state.data, ...data], status: DataStatus.success));
    } catch (e) {
      emit(state.copyWith(status: DataStatus.failure));
    }
  }

}