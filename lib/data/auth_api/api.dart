import 'package:grow_it_green/_common/constants/constants.dart';
import 'package:grow_it_green/data/auth_api/config/config.dart';
import 'package:grow_it_green/data/auth_api/entities/entities.dart';
import 'package:grow_it_green/data/helpers/api_client.dart';

part 'auth_api.dart';

abstract class AuthApi {
  Future<void> signUp({
    required String email,
    required String password,
  });

  Future<UserEntity> login({
    required String email,
    required String password,
  });
}
