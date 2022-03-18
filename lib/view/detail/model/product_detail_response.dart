class ProductDetailsResponse {
  ProductDetailsResponse({
    required this.id,
    required this.title,
    required this.price,
    required this.thumbnail,
  });

  late final String id;
  late final String title;
  late final double price;
  late final String thumbnail;

  ProductDetailsResponse.fromJson(Map<String, dynamic> json) {
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
