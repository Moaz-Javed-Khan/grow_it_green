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
      id: json['id'] as int,
      name: json['name'] as String?,
      image: json['image'] as String?,
      price: json['price'] as num?,
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
