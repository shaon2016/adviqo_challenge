import 'package:adviqo_challenge/global/widgets/global_image_loader.dart';
import 'package:adviqo_challenge/view/search/model/product_search_response.dart';
import 'package:flutter/material.dart';

class SearchItemView extends StatelessWidget {
  final ProductSearchResults item;

  const SearchItemView({Key? key, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const GlobalImageLoader(
          imageUrl: "",
          imageHeight: 48,
          imageWidth: 48,
        ),
        Expanded(
            child: Column(
          children:  [
            Text(
              "ID: ${item.id}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              item.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "Price: ${item.price}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        )),
      ],
    );
  }
}
