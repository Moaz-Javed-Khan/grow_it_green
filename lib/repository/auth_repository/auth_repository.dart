part of 'repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({
    AuthApi? authApi,
    super.cache,
    super.userController,
  }) : api = authApi ?? AuthApiImpl();

  final AuthApi api;

  @override
  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      final user = await api.login(
        email: email,
        password: password,
      );
      updateUser(User.fromEntity(user));
    } on CustomException catch (e) {
      throw LoginFailure(e.message);
    }
  }

  @override
  Future<void> logOut() async {
    try {
      updateUser(User.empty);
    } catch (_) {
      throw LogOutFailure();
    }
  }
}
