import 'package:hive_flutter/hive_flutter.dart';

part 'product.g.dart';

const productEntityName = "product";

@HiveType(typeId: 0)
class Product extends HiveObject {

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  Product({required this.id, required this.title});

  static Future<Box<Product>> openBox() async {
    return await Hive.openBox<Product>(productEntityName);
  }

  static Box<Product> openedBox() {
    return Hive.box<Product>(productEntityName);
  }
}
