import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:sales_system_pos/core/constants/boxes_names.dart';
import 'package:sales_system_pos/core/providers/product_mod_providers.dart';
import 'package:sales_system_pos/features/product/data/models/product_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Inicializar HIVE CE
  await Hive.initFlutter();

  // Registrar el adaptador de ProductModel() -> ProductModelAdapter()
  Hive.registerAdapter(ProductModelAdapter());

  // Abrir la caja de productos
  final productBox = await Hive.openBox<ProductModel>(
    BoxesNameHive.productsBox,
  );

  runApp(
    ProviderScope(
      overrides: [
        // Cargamos los datos(si hay) antes de iniciar la applicacion
        productBoxProvider.overrideWithValue(productBox),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grocery sales system',
      home: Scaffold(
        appBar: AppBar(title: const Text('Material App Bar')),
        body: const Center(child: Text('Hello World')),
      ),
    );
  }
}
