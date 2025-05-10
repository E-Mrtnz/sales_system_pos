import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:sales_system_pos/features/product/data/models/product_model.dart';
import 'package:sales_system_pos/features/product/domain/entities/product_entities.dart';

abstract class ProductLocalDataSource {
  Future<List<Product>> getProducts();
  Future<void> addProduct(Product product);
  Future<void> updateProduct(Product product);
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final Box<ProductModel> _box;

  // Inyectamos la caja de Hive
  ProductLocalDataSourceImpl(this._box);

  @override
  Future<List<Product>> getProducts() async {
    // Convertimos cada ProductModel a Product
    return _box.values.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> addProduct(Product product) async {
    await _box.put(product.id, ProductModel.fromEntity(product));
  }

  @override
  Future<void> updateProduct(Product product) async {
    if (!_box.containsKey(product.id)) {
      throw Exception("Producto no encontrado");
    }
    await _box.put(product.id, ProductModel.fromEntity(product));
  }
}
