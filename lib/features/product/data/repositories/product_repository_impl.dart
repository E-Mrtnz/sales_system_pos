import 'package:sales_system_pos/features/product/data/datasources/product_local_data_source.dart';
import 'package:sales_system_pos/features/product/domain/entities/product_entities.dart';
import 'package:sales_system_pos/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductLocalDataSource dataSource;

  // Inyectamos el DataSource
  ProductRepositoryImpl(this.dataSource);

  @override
  Future<List<Product>> getProducts() async {
    try {
      return await dataSource.getProducts();
    } catch (e) {
      throw Exception('Error al obtener productos: ${e.toString()}');
    }
  }

  @override
  Future<void> addProduct(Product product) async {
    try {
      return await dataSource.addProduct(product);
    } catch (e) {
      throw Exception('Error al añadir el producto: ${e.toString()}');
    }
  }

  @override
  Future<void> updateProduct(Product product) async {
    try {
      return await dataSource.updateProduct(product);
    } catch (e) {
      throw Exception(
        'Error al actualizar el producto: ${e.toString()}',
      );
    }
  }
}
