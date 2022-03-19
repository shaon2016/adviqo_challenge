import 'package:adviqo_challenge/core/app_routes.dart';
import 'package:adviqo_challenge/global/widgets/global_image_loader.dart';
import 'package:adviqo_challenge/view/detail/product_detail_page.dart';
import 'package:adviqo_challenge/view/search/model/product_search_response.dart';
import 'package:flutter/material.dart';

class ProductSearchItemView extends StatelessWidget {
  final ProductSearchResults item;

  const ProductSearchItemView({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, AppRoute.detailPage, arguments: item.id);
        },
        child: Row(
          children: [
            GlobalImageLoader(
              imageUrl: item.thumbnail,
              imageHeight: 48,
              imageWidth: 48,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 4,
                ),
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "Price: ${item.price}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
