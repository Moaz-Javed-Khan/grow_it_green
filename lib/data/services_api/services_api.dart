part of 'api.dart';

class ServiceApiImpl extends ServiceApi {
  ServiceApiImpl({
    required APIClient client,
  }) : _client = client;

  final APIClient _client;

  @override
  Future<List<ServiceEntity>> getServices() async {
    final response =
        await _client.get(handle: ServiceEndpoints.services, enableLogs: true);

    return (response as Map)
        .values
        .map((e) => ServiceEntity.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
