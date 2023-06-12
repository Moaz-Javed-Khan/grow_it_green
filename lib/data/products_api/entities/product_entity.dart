import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  const ProductEntity({
    required this.id,
    this.name,
    this.image,
    this.price,
    this.description,
  });

  factory ProductEntity.fromJson(Map<String, dynamic> json) {
    return ProductEntity(
      id: int.parse(json['id'] as String),
      name: json['name'] as String?,
      image: json['image'] as String?,
      price: num.tryParse(json['price'] as String),
      description: json['description'] as String?,
    );
  }

  final int id;
  final String? name;
  final String? image;
  final num? price;
  final String? description;

  @override
  List<Object?> get props => [
        id,
        name,
        image,
        price,
        description,
      ];
}
