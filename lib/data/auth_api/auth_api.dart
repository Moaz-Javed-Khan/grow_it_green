part of 'api.dart';

class AuthApiImpl extends AuthApi {
  AuthApiImpl({
    APIClient? client,
  }) : _client = client ?? APIClient();

  final APIClient _client;

  @override
  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    await _client.post(
      baseUrl: AuthEndpoints.signUpBaseUrl,
      handle: '${AuthEndpoints.signUp}?key=${AppConstants.firebaseAPIKey}',
      body: {
        'email': email,
        'password': password,
        'returnSecureToken': true,
      },
    );
  }

  @override
  Future<UserEntity> login({
    required String email,
    required String password,
  }) async {
    final response = await _client.post(
      baseUrl: AuthEndpoints.loginBaseUrl,
      handle: '${AuthEndpoints.login}?key=${AppConstants.firebaseAPIKey}',
      body: {
        'email': email,
        'password': password,
        'returnSecureToken': true,
      },
    );

    return UserEntity.fromJson(response);
  }
}
