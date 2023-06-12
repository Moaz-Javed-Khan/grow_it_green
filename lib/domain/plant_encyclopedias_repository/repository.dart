import 'dart:async';

import 'package:grow_it_green/data/plant_encyclopedias_api/api.dart';
import 'package:grow_it_green/domain/plant_encyclopedias_repository/models/plant_encyclopedia_model.dart';

export 'models/models.dart';

part 'plant_encyclopedias_repository.dart';

abstract class PlantEncyclopediasRepository {
  Future<List<PlantEncyclopedia>> getPlantEncyclopedias();
}
