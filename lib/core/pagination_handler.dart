import 'package:flutter/foundation.dart';

/// Handle pagination globally
/// @param loadItem default loadItem no,
/// send your desired item no you want to load from api.
mixin PaginationHandler {
  @protected
  void handleScrollWithIndex(int index, int page, Function callback,
      [int loadItem = 20]) {
    final itemPosition = index + 1;
    final requestMoreData = itemPosition % loadItem == 0 && itemPosition != 0;
    final pageToRequest = itemPosition ~/ loadItem;

    if (requestMoreData && pageToRequest + 1 >= page) {
      callback.call();
    }
  }
}
