import 'package:equatable/equatable.dart';

class PlantEncyclopediaEntity extends Equatable {
  const PlantEncyclopediaEntity({
    required this.id,
    this.name,
    this.image,
    this.season,
    this.description,
    this.amountOfWater,
    this.wateringFrequency,
  });

  factory PlantEncyclopediaEntity.fromJson(Map<String, dynamic> json) {
    return PlantEncyclopediaEntity(
      id: int.parse(json['id'] as String),
      name: json['name'] as String?,
      image: json['image'] as String?,
      season: json['season'] as String?,
      description: json['description'] as String?,
      amountOfWater: json['amountOfWater'] as String?,
      wateringFrequency: json['wateringFrequency'] as String?,
    );
  }

  final int id;
  final String? name;
  final String? image;
  final String? season;
  final String? description;
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
