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
    final response = {
      'id': 12,
      'name': "sdsad",
      'email': "asdasd",
      'phone': "asdasd",
      'addressText': "asdasd",
      'accessToken': "asdasdds",
    };
    // await _client.post(
    //   handle: AuthEndpoints.login,
    //   body: {
    //     'email': email,
    //     'password': password,
    //   },
    // );

    return UserEntity.fromJson(response as Map<String, dynamic>);
  }

  // key=[API_KEY]
}
