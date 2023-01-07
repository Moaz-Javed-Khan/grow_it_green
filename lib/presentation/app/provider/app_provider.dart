import 'dart:async';

import 'package:cache/cache.dart';
import 'package:flutter/material.dart';
import 'package:grow_it_green/repository/auth_repository/repository.dart';

enum OnboardingStatus { unknown, onboarded, notOnboarded }

enum AuthStatus { unknown, authenticated, unauthenticated }

class AppProvider extends ChangeNotifier {
  AppProvider({
    CacheClient? cache,
    required AuthRepository authRepository,
  })  : _cache = cache ?? CacheClient(),
        _authRepository = authRepository {
    // isOnboarded();
    if (authRepository.currentUser.isNotEmpty) {
      authStatus = AuthStatus.authenticated;
      user = authRepository.currentUser;
    } else {
      authStatus = AuthStatus.unauthenticated;
    }

    _userSubscription =
        _authRepository.user.listen((user) => appUserChanged(user));
  }

  final CacheClient _cache;
  final AuthRepository _authRepository;
  late final StreamSubscription<User> _userSubscription;

  OnboardingStatus onboardingStatus = OnboardingStatus.unknown;
  AuthStatus authStatus = AuthStatus.unknown;
  User user = User.empty;

  void appUserChanged(User appUser) {
    user = appUser;
    authStatus =
        appUser.isEmpty ? AuthStatus.unauthenticated : AuthStatus.authenticated;
  }

  @override
  void dispose() {
    _userSubscription.cancel();
    _authRepository.dispose();
    super.dispose();
  }
}
