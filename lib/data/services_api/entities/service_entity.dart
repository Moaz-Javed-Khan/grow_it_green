import 'package:equatable/equatable.dart';

class ServiceEntity extends Equatable {
  const ServiceEntity({
    required this.id,
    this.name,
    this.image,
    this.description,
    this.initialPrice,
    this.perHourRate,
    this.craftsmenType,
  });

  factory ServiceEntity.fromJson(Map<String, dynamic> json) {
    return ServiceEntity(
      id: int.parse(json['id'] as String),
      name: json['name'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
      initialPrice: num.tryParse(json['initialPrice'] as String),
      perHourRate: num.tryParse(json['perHourRate'] as String),
      craftsmenType: json['craftsmenType'] as String?,
    );
  }

  final int id;
  final String? name;
  final String? image;
  final String? description;
  final num? initialPrice;
  final num? perHourRate;
  final String? craftsmenType;

  @override
  List<Object?> get props => [
        id,
        name,
        image,
        description,
        initialPrice,
        perHourRate,
        craftsmenType,
      ];
}
