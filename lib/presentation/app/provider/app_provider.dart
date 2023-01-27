import 'dart:async';

import 'package:cache/cache.dart';
import 'package:flutter/material.dart';
import 'package:grow_it_green/_common/constants/constants.dart';
import 'package:grow_it_green/domain/auth_repository/repository.dart';

enum OnboardingStatus { unknown, onboarded, notOnboarded }

enum AuthStatus { unknown, authenticated, unauthenticated }

class AppProvider extends ChangeNotifier {
  AppProvider({
    CacheClient? cache,
    required AuthRepository authRepository,
  })  : _cache = cache ?? CacheClient(),
        _authRepository = authRepository {
    _isOnboarded();
    _isAuthenticated();

    _userSubscription =
        _authRepository.user.listen((user) => _appUserChanged(user));
  }

  final CacheClient _cache;
  final AuthRepository _authRepository;
  late final StreamSubscription<User> _userSubscription;

  // State Variables
  OnboardingStatus onboardingStatus = OnboardingStatus.unknown;
  AuthStatus authStatus = AuthStatus.unknown;
  User user = User.empty;

  void _isOnboarded() {
    final isOnboarded =
        _cache.read<bool>(key: AppConstants.onboardingCache) ?? false;

    if (isOnboarded) {
      onboardingStatus = OnboardingStatus.onboarded;
    } else {
      onboardingStatus = OnboardingStatus.notOnboarded;
    }
    notifyListeners();
  }

  void _isAuthenticated() {
    if (_authRepository.currentUser.isNotEmpty) {
      authStatus = AuthStatus.authenticated;
      user = _authRepository.currentUser;
    } else {
      authStatus = AuthStatus.unauthenticated;
    }
    notifyListeners();
  }

  void _appUserChanged(User appUser) {
    user = appUser;
    authStatus =
        appUser.isEmpty ? AuthStatus.unauthenticated : AuthStatus.authenticated;

    notifyListeners();
  }

  void onboardingCompleted() {
    _cache.write(key: AppConstants.onboardingCache, value: true);
    onboardingStatus = OnboardingStatus.onboarded;
    notifyListeners();
  }

  void login() {
    _authRepository.login(email: "email", password: "password");
  }

  void logout() {
    _authRepository.logOut();
  }

  @override
  void dispose() {
    _userSubscription.cancel();
    _authRepository.dispose();
    super.dispose();
  }
}
