import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:sales_system_pos/features/product/data/models/product_model.dart';
import 'package:sales_system_pos/features/product/data/repositories/product_repository.dart';
import 'package:sales_system_pos/features/product/domain/entities/product_entitie.dart';

class ProductRepositoryImpl implements ProductRepository {
  final Box<ProductModel> _box;

  ProductRepositoryImpl(this._box);

  @override
  Future<void> addProduct(Product product) async {
    try {
      await _box.put(product.id, ProductModel.fromEntity(product));
    } on HiveError catch (e) {
      throw Exception("Failed to add product: ${e.toString()}");
    }
  }

  @override
  Future<List<Product>> getProducts() async {
    try {
      return _box.values
          .map((model) => model.toEntity()) // Conversión aquí
          .toList();
    } on HiveError catch (e) {
      throw Exception("Failed to get products: ${e.toString()}");
    }
  }

  @override
  Future<void> updateProduct(Product product) async {
    try {
      await _box.put(
        product.id,
        ProductModel.fromEntity(product), // Conversión aquí
      );
    } on HiveError catch (e) {
      throw Exception("Failed to update product: ${e.toString()}");
    }
  }

  // Nuevo método delete
  @override
  Future<void> deleteProduct(String id) async {
    try {
      await _box.delete(id);
    } on HiveError catch (e) {
      throw Exception("Failed to deleted product: ${e.toString()}");
    }
  }
}
