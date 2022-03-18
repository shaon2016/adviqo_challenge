import 'package:flutter/material.dart';

class SearchTextFieldAreaView extends StatelessWidget {
  const SearchTextFieldAreaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16),
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Search",
              ),
            ),
          ),
          IconButton(
            onPressed: () {

            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
    );
  }
}
