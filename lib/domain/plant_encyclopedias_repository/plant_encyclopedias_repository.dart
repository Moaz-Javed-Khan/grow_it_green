part of 'repository.dart';

class PlantEncyclopediasRepositoryImpl extends PlantEncyclopediasRepository {
  PlantEncyclopediasRepositoryImpl({
    required PlantEncyclopediaApi plantEncyclopediaApi,
  }) : _api = plantEncyclopediaApi;

  final PlantEncyclopediaApi _api;

  @override
  Future<List<PlantEncyclopedia>> getPlantEncyclopedias() async {
    final response = await _api.getPlantEncyclopedias();

    return response.map((e) => PlantEncyclopedia.fromEntity(e)).toList();
  }
}
