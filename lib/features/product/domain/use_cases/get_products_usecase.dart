import 'package:sales_system_pos/features/product/data/repositories/product_repository.dart';
import 'package:sales_system_pos/features/product/domain/entities/product_entitie.dart';

class GetProductsUseCase {
  final ProductRepository repository;

  GetProductsUseCase(this.repository);

  Future<List<Product>> execute() async {
    final products = await repository.getProducts();
    return products.map((p) => p).toList();
  }
}
