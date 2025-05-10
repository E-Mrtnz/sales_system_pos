import 'package:sales_system_pos/features/product/domain/entities/product_entities.dart';
import 'package:sales_system_pos/features/product/domain/repositories/product_repository.dart';

class GetProductsUseCase {
  final ProductRepository repository;

  // Inyectamos el repositorio por constructor
  GetProductsUseCase(this.repository);

  // Ejecuta la obtención de productos
  Future<List<Product>> executeGetProducts() async {
    return await repository.getProducts();
  }
}
