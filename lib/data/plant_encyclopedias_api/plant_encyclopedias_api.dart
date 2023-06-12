part of 'api.dart';

class PlantEncyclopediaApiImpl extends PlantEncyclopediaApi {
  PlantEncyclopediaApiImpl({
    required APIClient client,
  }) : _client = client;

  final APIClient _client;

  @override
  Future<List<PlantEncyclopediaEntity>> getPlantEncyclopedias() async {
    final response = await _client.get(
        handle: PlantEncyclopediaEndpoints.plantEncyclopedias,
        enableLogs: true);

    return (response as Map)
        .values
        .map((e) => PlantEncyclopediaEntity.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
