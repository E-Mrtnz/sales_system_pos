import 'package:sales_system_pos/features/product/domain/entities/product_entities.dart';

class ProductState {
  final List<Product> products;
  final bool isLoading;
  final String? error;

  ProductState({
    required this.products,
    this.isLoading = false,
    this.error,
  });

  // Método para actualizar el estado
  ProductState copyWith({
    List<Product>? products,
    bool? isLoading,
    String? error,
  }) => ProductState(
    products: products ?? this.products,
    isLoading: isLoading ?? this.isLoading,
    error: error ?? this.error,
  );
}
