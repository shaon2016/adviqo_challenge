class ProductSearchResponse {
  ProductSearchResponse({
    required this.paging,
    required this.results,
  });

  late final Paging paging;
  late final List<ProductSearchResults> results;

  ProductSearchResponse.fromJson(Map<String, dynamic> json) {
    paging = Paging.fromJson(json['paging']);
    results = List.from(json['results'])
        .map((e) => ProductSearchResults.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['paging'] = paging.toJson();
    _data['results'] = results.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Paging {
  Paging({
    required this.total,
    required this.primaryResults,
    required this.offset,
    required this.limit,
  });

  late final int total;
  late final int primaryResults;
  late final int offset;
  late final int limit;

  Paging.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    primaryResults = json['primary_results'];
    offset = json['offset'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['total'] = total;
    _data['primary_results'] = primaryResults;
    _data['offset'] = offset;
    _data['limit'] = limit;
    return _data;
  }
}

class ProductSearchResults {
  ProductSearchResults({
    required this.id,
    required this.title,
    required this.price,
    required this.thumbnail,
  });

  late final String id;
  late final String title;
  late final double price;
  late final String thumbnail;

  ProductSearchResults.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'] != null
        ? json['price'] is int
            ? json['price'].toDouble()
            : json['price']
        : 0.0;
    thumbnail = json['thumbnail'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['price'] = price;
    _data['thumbnail'] = thumbnail;
    return _data;
  }
}
