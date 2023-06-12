import 'package:grow_it_green/data/helpers/api_client.dart';
import 'package:grow_it_green/data/services_api/config/endpoints.dart';
import 'package:grow_it_green/data/services_api/entities/entities.dart';

part 'services_api.dart';

abstract class ServiceApi {
  Future<List<ServiceEntity>> getServices();
}
