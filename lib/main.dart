import 'package:cache/cache.dart';
import 'package:flutter/material.dart';
import 'package:grow_it_green/api/helpers/api_config.dart';
import 'package:grow_it_green/bootstrap.dart';
import 'package:grow_it_green/repository/auth_repository/repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheClient.initializeCache();

  APIConfig.baseUrl = '';

  final authRepository = AuthRepositoryImpl();

  bootstrap(() => App(authRepository: authRepository));
}
