// En core/providers/hive_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:sales_system_pos/core/constants/name_boxes.dart';
import 'package:sales_system_pos/features/product/data/models/product_model.dart';

final productBoxProvider = Provider<Box<ProductModel>>((ref) {
  return Hive.box<ProductModel>(NameBoxes.productsBox);
});
