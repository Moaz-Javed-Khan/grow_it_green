import 'package:equatable/equatable.dart';
import 'package:grow_it_green/data/plant_encyclopedias_api/entities/plant_encyclopedia_entity.dart';

class PlantEncyclopedia extends Equatable {
  const PlantEncyclopedia({
    required this.id,
    required this.name,
    this.image,
    this.season,
    required this.description,
    this.amountOfWater,
    this.wateringFrequency,
  });

  factory PlantEncyclopedia.fromEntity(PlantEncyclopediaEntity entity) {
    return PlantEncyclopedia(
      id: entity.id,
      name: entity.name ?? 'Unknown',
      image: entity.image,
      season: entity.season,
      description: entity.description ?? 'Unavailable',
      amountOfWater: entity.amountOfWater,
      wateringFrequency: entity.wateringFrequency,
    );
  }

  final int id;
  final String name;
  final String? image;
  final String? season;
  final String description;
  final String? amountOfWater;
  final String? wateringFrequency;

  @override
  List<Object?> get props => [
        id,
        name,
        image,
        season,
        description,
        amountOfWater,
        wateringFrequency,
      ];
}
