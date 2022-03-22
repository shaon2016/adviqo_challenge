import 'package:adviqo_challenge/view/search/model/product_search_response.dart';
import 'package:equatable/equatable.dart';

import '../../../other/enums.dart';

/// Hold the search page data and its data manipulation state
class ProductSearchState extends Equatable {
  final DataStatus status;
  final List<ProductSearchResults> data;

  const ProductSearchState({required this.status, required this.data});

  ProductSearchState.init()
      : status = DataStatus.initial,
        data = [];

  ProductSearchState copyWith({
    DataStatus? status,
    List<ProductSearchResults>? data,
  }) {
    return ProductSearchState(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [status, data];
}
