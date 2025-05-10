class Product {
  final String id;
  final String name;
  final String imagePath;
  final String category;
  final String description;
  final String barcode;

  Product({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.category,
    required this.description,
    required this.barcode,
  }) {
    if (name.isEmpty) throw 'El nombre no puede estar vacío';
  }

  // Método para crear una copia modificada(útil en formularios de edición) de product para insertar nuevos valores
  Product copyWith(
    String? id,
    String? name,
    String? imagePath,
    String? category,
    String? description,
    String? barcode,
  ) => Product(
    id: id ?? this.id,
    name: name ?? this.name,
    imagePath: imagePath ?? this.imagePath,
    category: category ?? this.category,
    description: description ?? this.description,
    barcode: barcode ?? this.barcode,
  );
}
