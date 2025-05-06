import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:sales_system_pos/core/constants/name_boxes.dart';
import 'package:sales_system_pos/features/product/data/models/product_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter(); //Initialize hive_ce
  Hive.registerAdapter(ProductModelAdapter()); // Iniciando el Adapter
  await Hive.openBox<ProductModel>(
    NameBoxes.productsBox,
  ); // Inicializando la box

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Material App Bar')),
        body: const Center(child: Text('')),
      ),
    );
  }
}
