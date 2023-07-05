import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  const ProductEntity({
    required this.id,
    this.name,
    this.image,
    this.price,
    this.description,
    this.isFavorite,
  });

  factory ProductEntity.fromJson(Map<String, dynamic> json) {
    return ProductEntity(
      id: int.parse(json['id'] as String),
      name: json['name'] as String?,
      image: json['image'] as String?,
      price: num.tryParse(json['price'] as String),
      description: json['description'] as String?,
      isFavorite: json['isFavorite'] as bool?,
    );
  }

  final int id;
  final String? name;
  final String? image;
  final num? price;
  final String? description;
  final bool? isFavorite;

  @override
  List<Object?> get props => [
        id,
        name,
        image,
        price,
        description,
      ];
}
