import 'package:equatable/equatable.dart';
import 'package:grow_it_green/data/products_api/entities/product_entity.dart';

class Product extends Equatable {
  Product({
    required this.id,
    required this.name,
    this.image,
    this.price,
    required this.description,
    required this.isFavorite,
  });

  factory Product.fromEntity(ProductEntity entity) {
    return Product(
      id: entity.id,
      name: entity.name ?? 'Unknown',
      image: entity.image,
      price: entity.price,
      description: entity.description ?? 'Unavailable',
      isFavorite: entity.isFavorite ?? false,
    );
  }

  final int id;
  final String name;
  final String? image;
  final num? price;
  final String description;
  bool isFavorite;

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
  }

  @override
  List<Object?> get props => [
        id,
        name,
        image,
        price,
        description,
      ];
}
