class AuthEndpoints {
  // This class is not meant to be instantiated or extended;
  // this constructor prevents instantiation and extension.
  const AuthEndpoints._();

  static const signUpBaseUrl = 'https://identitytoolkit.googleapis.com';
  static const signUp = '/v1/accounts:signUp';

  static const loginBaseUrl = 'https://identitytoolkit.googleapis.com';
  static const login = '/v1/accounts:signInWithPassword';
}
