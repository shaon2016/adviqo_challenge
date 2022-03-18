import 'package:adviqo_challenge/view/search/model/product_search_response.dart';
import 'package:equatable/equatable.dart';

import '../../../other/enums.dart';

class SearchState extends Equatable {
  final DataStatus status;
  final List<ProductSearchResults> data;

  const SearchState({required this.status, required this.data});

  SearchState.init()
      : status = DataStatus.initial,
        data = [];

  SearchState copyWith({
    DataStatus? status,
    List<ProductSearchResults>? data,
  }) {
    return SearchState(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [status, data];
}
