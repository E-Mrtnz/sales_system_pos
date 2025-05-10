import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_system_pos/features/product/domain/entities/product_entities.dart';
import 'package:sales_system_pos/features/product/domain/use_cases/add_product.dart';
import 'package:sales_system_pos/features/product/domain/use_cases/get_products.dart';
import 'package:sales_system_pos/features/product/presentation/providers/product_state.dart';

class ProductNotifier extends StateNotifier<ProductState> {
  final GetProductsUseCase getProductsUseCase;
  final AddProductUseCase addProductUseCase;

  ProductNotifier({
    required this.getProductsUseCase,
    required this.addProductUseCase,
  }) : super(ProductState(products: [])) {
    loadProducts(); // Carga inicial de productos
  }

  // Carga los productos desde el DataSource
  Future<void> loadProducts() async {
    state = state.copyWith(isLoading: true);

    try {
      final products = await getProductsUseCase.executeGetProducts();
      state = state.copyWith(products: products, error: null);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> addNewProduct(Product product) async {
    try {
      await addProductUseCase.executeAddProduct(product);
      await loadProducts();
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }
}
