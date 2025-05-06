import 'package:sales_system_pos/features/product/domain/entities/product_entitie.dart';

abstract class ProductRepository {
  Future<void> addProduct(Product product);
  Future<List<Product>> getProducts();
  Future<void> updateProduct(Product product);
  Future<void> deleteProduct(String id);
}
