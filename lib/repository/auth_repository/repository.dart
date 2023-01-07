import 'dart:async';
import 'dart:convert';

import 'package:cache/cache.dart';
import 'package:flutter/material.dart';
import 'package:grow_it_green/_common/helpers/custom_exception.dart';
import 'package:grow_it_green/api/auth_api/api.dart';
import 'package:grow_it_green/repository/auth_repository/models/models.dart';

export 'models/models.dart';

part 'auth_repository.dart';

/// {@template authentication_repository}
/// Repository which manages user authentication.
/// {@endtemplate}
abstract class AuthRepository {
  /// {@macro authentication_repository}
  AuthRepository({
    CacheClient? cache,
    StreamController<User>? userController,
  })  : _cache = cache ?? CacheClient(),
        _userController = userController ?? StreamController<User>.broadcast();

  final CacheClient _cache;
  final StreamController<User> _userController;

  /// Updates the user stream with the new [user].
  void updateUser(User user) => _userController.add(user);

  /// User cache key.
  /// Should only be used for testing purposes.
  @visibleForTesting
  static const userCacheKey = '__user_cache_key__';

  /// Stream of [User] which will emit the current user when
  /// the authentication state changes.
  ///
  /// Emits [User.empty] if the user is not authenticated.
  Stream<User> get user async* {
    yield currentUser;
    yield* _userController.stream.map((user) {
      _cache.write<String>(
        key: userCacheKey,
        value: jsonEncode(user.toJson()),
      );
      return user;
    });
  }

  /// Returns the current cached user.
  /// Defaults to [User.empty] if there is no cached user.
  User get currentUser {
    final userJson = _cache.read<String>(key: userCacheKey);
    return userJson == null
        ? User.empty
        : User.fromJson(jsonDecode(userJson) as Map<String, dynamic>);
  }

  bool get isAuthenticated => currentUser.isNotEmpty;

  /// JWT token of current user
  String? get authToken => currentUser.jwt;

  /// id of the current user
  int? get userId => currentUser.isEmpty ? null : currentUser.id;

  /// Signs out the current user which will emit
  /// [User.empty] from the [user] Stream.
  ///
  /// Throws a [LogOutFailure] if an exception occurs.
  Future<void> logOut();

  /// Signs in with the provided [email] and [password].
  ///
  /// Throws a [LoginFailure] if an exception occurs.
  Future<void> login({
    required String email,
    required String password,
  });

  /// disposes the _userController stream
  Future<void> dispose() async {
    await _userController.close();
    await _cache.close();
  }
}
