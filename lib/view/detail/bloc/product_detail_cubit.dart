import 'package:adviqo_challenge/other/enums.dart';
import 'package:adviqo_challenge/view/detail/bloc/product_detail_state.dart';
import 'package:adviqo_challenge/view/detail/repo/product_detail_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Details page business logic and a medium between state and view
class ProductDetailCubit extends Cubit<ProductDetailState> {
  final ProductDetailRepo _productDetailRepo;

  ProductDetailCubit(this._productDetailRepo, String productId)
      : super(const ProductDetailState.init()) {
    fetch(productId);
  }

  fetch(String productId) async {
    try {
      emit(state.copyWith(status: DataStatus.loading));

      final data = await _productDetailRepo.fetch(productId);

      emit(state.copyWith(status: DataStatus.success, data: data));
    } catch (e) {
      emit(state.copyWith(status: DataStatus.failure));
    }
  }
}
