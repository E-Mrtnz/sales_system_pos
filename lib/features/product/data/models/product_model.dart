import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:sales_system_pos/features/product/domain/entities/product_entities.dart';

part 'product_model.g.dart';

@HiveType(typeId: 2)
class ProductModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String imagePath;
  @HiveField(3)
  final String category;
  @HiveField(4)
  final String description;
  @HiveField(5)
  final String barcode;

  ProductModel({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.category,
    required this.description,
    required this.barcode,
  }) {
    if (name.isEmpty) throw 'El nombre no puede estar vacío';
  }

  // Conversión: Entidad → Modelo
  factory ProductModel.fromEntity(Product entity) => ProductModel(
    id: entity.id,
    name: entity.name,
    imagePath: entity.imagePath,
    category: entity.category,
    description: entity.description,
    barcode: entity.barcode,
  );

  // Conversión: Modelo → Entidad
  Product toEntity() => Product(
    id: id,
    name: name,
    imagePath: imagePath,
    category: category,
    description: description,
    barcode: barcode,
  );
}
