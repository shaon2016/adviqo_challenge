import 'package:adviqo_challenge/view/detail/model/product_detail_response.dart';
import 'package:equatable/equatable.dart';

import '../../../other/enums.dart';

class ProductDetailState extends Equatable {
  final DataStatus status;
  final ProductDetailsResponse? data;

  const ProductDetailState({required this.status, required this.data});

  const ProductDetailState.init()
      : status = DataStatus.initial,
        data = null;

  ProductDetailState copyWith(
      {DataStatus? status, ProductDetailsResponse? data}) {
    return ProductDetailState(
        status: status ?? this.status, data: data ?? this.data);
  }

  @override
  List<Object?> get props => [data];
}
