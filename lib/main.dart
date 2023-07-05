import 'package:cache/cache.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grow_it_green/bootstrap.dart';
import 'package:grow_it_green/data/helpers/api_config.dart';
import 'package:grow_it_green/domain/auth_repository/repository.dart';
import 'package:grow_it_green/presentation/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await CacheClient.initializeCache();

  APIConfig.baseUrl =
      'https://grow-it-green-default-rtdb.asia-southeast1.firebasedatabase.app';

  final authRepository = AuthRepositoryImpl();

  bootstrap(() => App(authRepository: authRepository));
}
