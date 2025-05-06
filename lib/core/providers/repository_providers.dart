import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_system_pos/core/providers/hive_providers.dart';
import 'package:sales_system_pos/features/product/data/repositories/product_repository.dart';
import 'package:sales_system_pos/features/product/data/repositories/product_repository_impl.dart';
import 'package:sales_system_pos/features/product/domain/use_cases/get_products_usecase.dart';

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  final box = ref.watch(productBoxProvider);
  return ProductRepositoryImpl(box);
});

// En casos de uso:
final getProductsUseCaseProvider = Provider<GetProductsUseCase>((ref) {
  return GetProductsUseCase(ref.watch(productRepositoryProvider));
});
