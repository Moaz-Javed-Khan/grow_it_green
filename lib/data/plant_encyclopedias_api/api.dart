import 'package:grow_it_green/data/helpers/api_client.dart';
import 'package:grow_it_green/data/plant_encyclopedias_api/config/endpoints.dart';
import 'package:grow_it_green/data/plant_encyclopedias_api/entities/entities.dart';

part 'plant_encyclopedias_api.dart';

abstract class PlantEncyclopediaApi {
  Future<List<PlantEncyclopediaEntity>> getPlantEncyclopedias();
}
