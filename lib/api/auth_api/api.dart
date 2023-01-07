import 'package:grow_it_green/api/auth_api/config/config.dart';
import 'package:grow_it_green/api/auth_api/entities/entities.dart';
import 'package:grow_it_green/api/helpers/api_client.dart';

part 'auth_api.dart';

abstract class AuthApi {
  Future<UserEntity> login({
    required String email,
    required String password,
  });
}
