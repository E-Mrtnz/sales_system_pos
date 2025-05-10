import 'package:sales_system_pos/features/product/domain/entities/product_entities.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts(); // Obtener todos los productos
  Future<void> addProduct(Product product); // Añadir un producto
  Future<void> updateProduct(Product product); // Actualizar un producto
}
