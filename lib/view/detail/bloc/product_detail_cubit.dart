import 'package:adviqo_challenge/other/enums.dart';
import 'package:adviqo_challenge/view/detail/bloc/product_detail_state.dart';
import 'package:adviqo_challenge/view/detail/repo/product_detail_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  final ProductDetailRepo _productDetailRepo;

  ProductDetailCubit(this._productDetailRepo)
      : super(const ProductDetailState.init()) {
    fetch();
  }

  fetch() async {
    try {
      emit(state.copyWith(status: DataStatus.loading));

      final data = await _productDetailRepo.fetch();

      emit(state.copyWith(status: DataStatus.success, data: data));
    } catch (e) {
      emit(state.copyWith(status: DataStatus.failure));
    }
  }
}
