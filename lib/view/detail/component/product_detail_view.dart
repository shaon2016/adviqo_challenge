import 'package:adviqo_challenge/global/widgets/global_image_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../other/enums.dart';
import '../bloc/product_detail_cubit.dart';
import '../bloc/product_detail_state.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductDetailCubit, ProductDetailState>(
        builder: (ctx, state) {
          switch (state.status) {
            case DataStatus.initial:
              return Container();
            case DataStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case DataStatus.success:
              return SingleChildScrollView(
                child: Column(
                  children: [
                    GlobalImageLoader(
                      imageUrl: state.data?.thumbnail ?? "",
                      imageHeight: 200,
                      imageWidth: double.infinity,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            "ID: ${state.data?.id ?? ""}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            state.data?.title ?? "",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Price: ${state.data?.price ?? 0.0}",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            case DataStatus.failure:
              return const Text("Failed to load data");
          }
        },
        listener: (ctx, state) {});
  }
}
