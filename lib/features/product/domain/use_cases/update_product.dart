import 'package:sales_system_pos/features/product/domain/entities/product_entities.dart';
import 'package:sales_system_pos/features/product/domain/repositories/product_repository.dart';

class UpdateProductUseCase {
  final ProductRepository repository;

  UpdateProductUseCase(this.repository);

  Future<void> execute(Product product) async {
    return await repository.updateProduct(product);
  }
}
