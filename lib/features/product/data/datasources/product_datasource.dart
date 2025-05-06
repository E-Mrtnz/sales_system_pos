import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:sales_system_pos/features/product/data/models/product_model.dart';
import 'package:sales_system_pos/features/product/domain/entities/product_entitie.dart';

class ProductDataSource {
  ProductDataSource(this._box);

  final Box<ProductModel> _box;

  // Setter
  Future<void> addProduct(Product product) async {
    await _box.put(product.id, ProductModel.fromEntity(product));
  }

  // Getter
  Future<List<Product>> getProducts() async {
    return _box.values.map((model) => model.toEntity()).toList();
  }

  // Future<void> updateProduct(Product product) async {
  //   if (_box.containsKey(product.id)) {
  //     throw Exception("Product not found");
  //   }
  //   await _box.put(product.id, ProductModel.fromEntity(product));
  // }

  Future<void> updateProduct(Product product) async {
    await _box.put(product.id, ProductModel.fromEntity(product));
  }
}
