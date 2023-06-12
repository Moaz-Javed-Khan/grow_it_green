import 'dart:async';
import 'dart:developer';

import 'package:grow_it_green/data/services_api/api.dart';
import 'package:grow_it_green/domain/services_repository/models/service_model.dart';

export 'models/models.dart';

part 'services_repository.dart';

abstract class ServicesRepository {
  Future<List<Service>> getServices();
}
