import 'package:equatable/equatable.dart';
import 'package:grow_it_green/data/services_api/entities/service_entity.dart';

class Service extends Equatable {
  const Service({
    required this.id,
    required this.name,
    this.image,
    required this.description,
    this.initialPrice,
    this.perHourRate,
    this.craftsmenType,
  });

  factory Service.fromEntity(ServiceEntity entity) {
    return Service(
      id: entity.id,
      name: entity.name ?? 'Unknown',
      image: entity.image,
      description: entity.description ?? 'Unavailable',
      initialPrice: entity.initialPrice,
      perHourRate: entity.perHourRate,
      craftsmenType: entity.craftsmenType,
    );
  }

  final int id;
  final String name;
  final String? image;
  final String description;
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
