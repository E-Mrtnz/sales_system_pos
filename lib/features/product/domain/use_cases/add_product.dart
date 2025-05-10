import 'package:sales_system_pos/features/product/domain/entities/product_entities.dart';
import 'package:sales_system_pos/features/product/domain/repositories/product_repository.dart';

class AddProductUseCase {
  final ProductRepository repository;

  AddProductUseCase(this.repository);

  Future<void> executeAddProduct(Product product) async {
    return await repository.addProduct(product);
  }
}
