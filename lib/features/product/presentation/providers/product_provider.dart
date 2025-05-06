import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_system_pos/features/product/domain/entities/product_entitie.dart';
import 'package:sales_system_pos/features/product/domain/use_cases/get_products_usecase.dart';

class ProductState {
  final List<Product> products;
  final bool isLoading;
  final String? error;

  ProductState({
    this.products = const [],
    this.isLoading = false,
    this.error,
  });

  ProductState copyWith({
    List<Product>? products,
    bool? isLoading,
    String? error,
  }) {
    return ProductState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class ProductNotifier extends StateNotifier<ProductState> {
  final GetProductsUseCase getProducts;
  // final AddProductUseCase addProduct;

  ProductNotifier({
    required this.getProducts,
    // , required this.addProduct
  }) : super(ProductState()) {
    loadProducts();
  }

  Future<void> loadProducts() async {
    state = state.copyWith(isLoading: true);
    try {
      final products = await getProducts.execute();
      state = state.copyWith(products: products);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
