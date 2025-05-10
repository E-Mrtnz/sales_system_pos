import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:sales_system_pos/features/product/data/datasources/product_local_data_source.dart';
import 'package:sales_system_pos/features/product/data/models/product_model.dart';
import 'package:sales_system_pos/features/product/data/repositories/product_repository_impl.dart';
import 'package:sales_system_pos/features/product/domain/repositories/product_repository.dart';
import 'package:sales_system_pos/features/product/domain/use_cases/add_product.dart';
import 'package:sales_system_pos/features/product/domain/use_cases/get_products.dart';
import 'package:sales_system_pos/features/product/presentation/providers/product_notifier.dart';
import 'package:sales_system_pos/features/product/presentation/providers/product_state.dart';

// Proveedor para la caja de Hive
final productBoxProvider = Provider<Box<ProductModel>>(
  (ref) =>
      throw UnimplementedError('Overridear este provider en main.dart'),
);

// Proveedor para el DataSource
final productLocalDataSourceProvider = Provider<ProductLocalDataSource>(
  (ref) => ProductLocalDataSourceImpl(ref.watch(productBoxProvider)),
);

// Proveedor para el Repositorio
final productRepositoryProvider = Provider<ProductRepository>(
  (ref) =>
      ProductRepositoryImpl(ref.watch(productLocalDataSourceProvider)),
);

// Proveedores para los Casos de Uso
final getProductsUseCaseProvider = Provider<GetProductsUseCase>(
  (ref) => GetProductsUseCase(ref.watch(productRepositoryProvider)),
);

final addProductUseCaseProvider = Provider<AddProductUseCase>(
  (ref) => AddProductUseCase(ref.watch(productRepositoryProvider)),
);

// Proveedor para el Notifier

final productNotifierProvider =
    StateNotifierProvider<ProductNotifier, ProductState>(
      (ref) => ProductNotifier(
        getProductsUseCase: ref.watch(getProductsUseCaseProvider),
        addProductUseCase: ref.watch(addProductUseCaseProvider),
      ),
    );
