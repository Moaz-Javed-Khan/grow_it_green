part of 'repository.dart';

class ServicesRepositoryImpl extends ServicesRepository {
  ServicesRepositoryImpl({
    required ServiceApi serviceApi,
  }) : _api = serviceApi;

  final ServiceApi _api;

  @override
  Future<List<Service>> getServices() async {
    final response = await _api.getServices();

    return response.map((e) => Service.fromEntity(e)).toList();
  }
}
